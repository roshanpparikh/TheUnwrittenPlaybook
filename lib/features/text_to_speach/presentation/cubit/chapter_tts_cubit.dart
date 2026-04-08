import 'dart:async';
import 'dart:io';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/enum_gender.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import '../../domain/use_cases/generate_chapter_speech_use_case.dart';
import '../../domain/use_cases/get_chapter_speech_use_case.dart';
import 'chapter_tts_state.dart';

class ChapterTtsCubit extends Cubit<ChapterTtsState> {
  final GetChapterSpeechUseCase getChapterSpeechUseCase;
  final GenerateChapterSpeechUseCase generateChapterSpeechUseCase;
  final AudioPlayer player;

  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration?>? _durationSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  ChapterTtsCubit({
    required this.getChapterSpeechUseCase,
    required this.generateChapterSpeechUseCase,
    required this.player,
  }) : super(ChapterTtsState.initial()) {
    _bindPlayer();
  }

  void _bindPlayer() {
    _positionSub = player.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    _durationSub = player.durationStream.listen((duration) {
      emit(state.copyWith(duration: duration ?? Duration.zero));
    });

    _playerStateSub = player.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        emit(state.copyWith(status: ChapterTtsStatus.playing));
      } else {
        if (state.status == ChapterTtsStatus.playing) {
          emit(state.copyWith(status: ChapterTtsStatus.paused));
        }
      }
    });
  }


  Future<void> loadOrGenerate({
    required String bookId,
    required String chapterId,
    required ChapterContentModel content,
    required TtsVoice voice,
    required Gender userGender,
  }) async {
    try {
      emit(state.copyWith(
        status: ChapterTtsStatus.loading,
        error: null,
      ));

      final expectedChunks = ChapterSpeechChunkMapper.mapFromContent(
        content,
        gender: userGender,
      );

      final existing = await getChapterSpeechUseCase.execute(
        bookId: bookId,
        chapterId: chapterId,
        voice: voice,
      );

      debugPrint("loadOrGenerate(): chapterSpeech exists: ${existing != null}");

      bool needsGeneration(ChapterSpeech? speech) {
        if (speech == null) return true;

        final existingById = {
          for (final chunk in speech.chunks) chunk.id: chunk,
        };

        for (final expected in expectedChunks) {
          final existingChunk = existingById[expected.id];

          if (existingChunk == null) {
            debugPrint('Missing chunk: ${expected.id}');
            return true;
          }

          if (!existingChunk.isReady) {
            debugPrint('Chunk not ready: ${expected.id}');
            return true;
          }

          if (existingChunk.localPath.isEmpty) {
            debugPrint('Chunk has empty path: ${expected.id}');
            return true;
          }

          final file = File(existingChunk.localPath);
          if (!file.existsSync()) {
            debugPrint('Chunk file missing: ${expected.id}, path: ${file.path}');
            return true;
          }
        }

        return false;
      }

      ChapterSpeech speech;

      if (needsGeneration(existing)) {
        emit(state.copyWith(
          isGenerating: true,
          totalChunks: expectedChunks.length,
          completedChunks: 0,
          currentChunkLabel: null,
        ));

        await generateChapterSpeechUseCase.execute(
          bookId: bookId,
          chapterId: chapterId,
          chunks: expectedChunks,
          voice: voice,
          onProgress: (progress) {
            emit(state.copyWith(
              totalChunks: progress.totalChunks,
              completedChunks: progress.completedChunks,
              currentChunkLabel: progress.currentChunkLabel,
            ));
          },
        );

        speech = (await getChapterSpeechUseCase.execute(
          bookId: bookId,
          chapterId: chapterId,
          voice: voice,
        )) ??
            (throw Exception('Speech was generated but could not be reloaded'));

        emit(state.copyWith(isGenerating: false));
      } else {
        speech = existing!;
      }

      final sortedChunks = [...speech.chunks]
        ..sort((a, b) => a.order.compareTo(b.order));

      final List<AudioSource> sources = [];
      for (final chunk in sortedChunks) {
        if (!chunk.isReady || chunk.localPath.isEmpty) continue;

        final file = File(chunk.localPath);

        if (!file.existsSync()) continue;
        final source = AudioSource.file(chunk.localPath);
        sources.add(source);
      }

      if (sources.isEmpty) {
        throw Exception('No playable audio chunks found');
      }

      final mergedPath = await mergeMp3Files(
        inputPaths: speech.chunks
            .where((c) => c.isReady && c.localPath.isNotEmpty)
            .map((c) => c.localPath)
            .toList(),
        outputFileName: '${bookId}_${chapterId}_${voice.identifier}_full.mp3',      );
      await player.setAudioSource(AudioSource.file(mergedPath));
      emit(state.copyWith(
        status: ChapterTtsStatus.ready,
        isGenerating: false,
      ));
    } catch (e, st) {
      debugPrintStack(label: e.toString(), stackTrace: st);
      emit(state.copyWith(
        status: ChapterTtsStatus.error,
        error: e.toString(),
        isGenerating: false,
      ));
    }
  }

  Future<void> play() => player.play();

  Future<void> pause() => player.pause();

  Future<void> stop() async {
    await player.pause();
    await player.seek(Duration.zero);

    emit(state.copyWith(
      status: ChapterTtsStatus.ready,
      position: Duration.zero,
    ));
  }

  Future<void> seek(Duration position) => player.seek(position);

  @override
  Future<void> close() async {
    await _positionSub?.cancel();
    await _durationSub?.cancel();
    await _playerStateSub?.cancel();
    await player.dispose();
    return super.close();
  }
}

Future<String> _createConcatFile(List<String> inputPaths) async {
  final dir = await getTemporaryDirectory();
  final file = File('${dir.path}/tts_concat_list.txt');

  final content = inputPaths
      .map((path) => "file '${path.replaceAll("'", r"'\''")}'")
      .join('\n');

  await file.writeAsString(content, flush: true);
  return file.path;
}

Future<String> _getMergedOutputFilePath(String outputFileName) async {
  final dir = await getTemporaryDirectory();
  return '${dir.path}/$outputFileName';
}

Future<String> mergeMp3Files({
  required List<String> inputPaths,
  required String outputFileName,
}) async {
  if (inputPaths.isEmpty) {
    throw Exception('No input files to merge.');
  }

  for (final path in inputPaths) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('Missing input file: $path');
    }
  }

  final concatFilePath = await _createConcatFile(inputPaths);
  final outputPath = await _getMergedOutputFilePath(outputFileName);

  final outputFile = File(outputPath);
  if (outputFile.existsSync()) {
    await outputFile.delete();
  }

  final command =
      '-y -f concat -safe 0 -i "$concatFilePath" -acodec libmp3lame -b:a 192k "$outputPath"';

  final session = await FFmpegKit.execute(command);
  final returnCode = await session.getReturnCode();

  await File(concatFilePath).delete().catchError((_) {});

  if (ReturnCode.isSuccess(returnCode)) {
    return outputPath;
  } else {
    final logs = await session.getLogsAsString();
    throw Exception('Merge failed: $logs');
  }
}