import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/clients/tts_remote_data_source.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/models/tts_generation_progress.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import '../../domain/repositories/tts_repository.dart';
import '../data_sources/tts_local_data_source.dart';

class TtsRepositoryImpl implements TtsRepository {
  final TtsLocalDataSource local;
  final TtsRemoteDataSource remote;
  final TtsFileStore fileStore;

  TtsRepositoryImpl({
    required this.local,
    required this.remote,
    TtsFileStore? fileStore,
  }) : fileStore = fileStore ?? TtsFileStoreImpl();

  @override
  Future<ChapterSpeech?> getStoredChapterSpeech({
    required String bookId,
    required String chapterId,
    required TtsVoice voice,
  }) {
    return local.getChapterSpeech(
      bookId: bookId,
      chapterId: chapterId,
      voice: voice.identifier,
    );
  }

  @override
  Future<ChapterSpeech> generateAndStoreChapterSpeech({
  required String bookId,
  required String chapterId,
  required List<ChapterSpeechChunk> chunks,
  required TtsVoice voice,
  void Function(TtsGenerationProgress progress)? onProgress,
}) async {
  final totalChunks = chunks.length;
  var completed = 0;

  final speechId = ChapterSpeech.generateId(
    bookId: bookId,
    chapterId: chapterId,
    voiceIdentifier: voice.identifier,
  );

  final generatedChunks = <ChapterSpeechChunk>[];

  for (final chunk in chunks) {
    final existing = await local.getChunk(
      speechId: speechId,
      chunkId: chunk.id,
    );

    final canReuseExisting = existing != null &&
        existing.isReady &&
        existing.localPath.isNotEmpty &&
        fileStore.exists(existing.localPath);

    if (canReuseExisting) {
      generatedChunks.add(existing!);

      completed++;
      onProgress?.call(
        TtsGenerationProgress(
          totalChunks: totalChunks,
          completedChunks: completed,
          currentChunkId: chunk.id,
          currentChunkLabel: chunk.label,
        ),
      );
      continue;
    }

    final bytes = await remote.synthesizeText(
      text: chunk.text,
      voiceId: voice.voiceId,
      format: 'mp3',
    );

    final path = await fileStore.saveChunkBytes(
      bookId: bookId,
      chapterId: chapterId,
      voiceIdentifier: voice.identifier,
      chunkId: chunk.id,
      bytes: bytes,
      fileExtension: 'mp3',
    );

    final updatedChunk = ChapterSpeechChunk(
      id: chunk.id,
      order: chunk.order,
      text: chunk.text,
      label: chunk.label,
      localPath: path,
      isReady: true,
    );

    await local.saveChunk(
      chapterId: chapterId,
      bookId: bookId,
      speechId: speechId,
      chunk: updatedChunk,
    );

    generatedChunks.add(updatedChunk);

    completed++;
    onProgress?.call(
      TtsGenerationProgress(
        totalChunks: totalChunks,
        completedChunks: completed,
        currentChunkId: chunk.id,
        currentChunkLabel: chunk.label,
      ),
    );
  }

  final speech = ChapterSpeech(
    bookId: bookId,
    chapterId: chapterId,
    voice: voice,
    chunks: generatedChunks,
  );

  await local.saveChapterSpeech(speech);

  return speech;
}

  @override
  Future<void> deleteChapterSpeech({
    required String bookId,
    required String chapterId,
    required TtsVoice voice,
  }) async {
    final existing = await local.getChapterSpeech(
      bookId: bookId,
      chapterId: chapterId,
      voice: voice.identifier,
    );

    if (existing != null) {
      for (final chunk in existing.chunks) {
        if (chunk.localPath.isNotEmpty) {
          await fileStore.deleteFile(chunk.localPath);
        }
      }
    }

    await local.deleteChapterSpeech(
      bookId: bookId,
      chapterId: chapterId,
      voice: voice.identifier,
    );
  }

  @override
  Future<List<int>> generateSpeech({
    required String text,
    required TtsVoice voice,
  }) async {
    return remote.synthesizeText(
      text: text,
      voiceId: voice.voiceId,
      format: 'mp3',
    );
  }

  @override
  Future<List<ChapterSpeech>> getAllChapterSpeeches({
    String? bookId,
    TtsVoice? voice,
  }) {
    return local.getAllChapterSpeeches(
      bookId: bookId,
      voiceIdentifier: voice?.identifier,
    );
  }
}

abstract class TtsFileStore {
  Future<String> saveChunkBytes({
    required String bookId,
    required String chapterId,
    required String voiceIdentifier,
    required String chunkId,
    required List<int> bytes,
    required String fileExtension,
  });

  Future<void> deleteFile(String path);

  bool exists(String path);
}

class TtsFileStoreImpl implements TtsFileStore {
  @override
  Future<String> saveChunkBytes({
    required String bookId,
    required String chapterId,
    required String voiceIdentifier,
    required String chunkId,
    required List<int> bytes,
    required String fileExtension,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final ttsDir = Directory(
      '${dir.path}/tts/$bookId/$chapterId/$voiceIdentifier',
    );

    if (!ttsDir.existsSync()) {
      ttsDir.createSync(recursive: true);
    }

    final file = File('${ttsDir.path}/$chunkId.$fileExtension');
    await file.writeAsBytes(bytes, flush: true);

    return file.path;
  }

  @override
  Future<void> deleteFile(String path) async {
    final file = File(path);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  bool exists(String path) {
    return File(path).existsSync();
  }
}