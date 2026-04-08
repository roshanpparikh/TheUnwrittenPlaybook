import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/data_sources/chapter_speech_chunk_isar.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice_factory.dart';
import '../data_sources/chapter_speech_isar.dart';

class ChapterSpeechModel  {
  final String id;
  final String bookId;
  final String chapterId;
  final TtsVoice voice;
  final List<ChapterSpeechChunkModel> chunks;

  ChapterSpeechModel({
    required this.bookId,
    required this.chapterId,
    required this.voice,
    required this.chunks,
    required this.id
  });


  factory ChapterSpeechModel.fromEntity(ChapterSpeech entity) {
    return ChapterSpeechModel(
      id: entity.id,
      bookId: entity.bookId,
      chapterId: entity.chapterId,
      voice: entity.voice,
      chunks: entity.chunks.map((entity) {
        return ChapterSpeechChunkModel(
          label: entity.label,
            chunkId: entity.id, order: entity.order, text: entity.text, localPath: entity.localPath, isReady: entity.isReady);
      }).toList()
    );
  }

  static ChapterSpeechModel? fromIsar(ChapterSpeechIsar isar, {
    required List<ChapterSpeechChunkIsar> chunkRecords,
  }) {
    final voice = TtsVoiceFactory.fromVoiceIdentifier(isar.voiceId);
    if(voice == null) return null;
    return ChapterSpeechModel(
      id: isar.uniqueKey,
      bookId: isar.bookId,
      chapterId: isar.chapterId,
      voice: voice,
    chunks: chunkRecords.map((isar) {
      return ChapterSpeechChunkModel(
        label: isar.label,
          chunkId: isar.chunkId, order: isar.order, text: isar.text, localPath: isar.localPath, isReady: isar.isReady);
    }).toList()
    );
  }

  ChapterSpeechIsar toIsar() {
    final isar = ChapterSpeechIsar()
      ..bookId = bookId
      ..chapterId = chapterId
      ..voiceId = voice.identifier
      ..uniqueKey = id;

    return isar;
  }

  List<ChapterSpeechChunkIsar> toChunkIsarList() {
    return chunks.map((chunk) {
      return ChapterSpeechChunkIsar()
        ..label = chunk.label
        ..chapterId = chapterId
        ..bookId = bookId
        ..speechId = id
        ..order = chunk.order
        ..uniqueKey = '$id::${chunk.chunkId}'
        ..chunkId = chunk.chunkId
        ..text = chunk.text
        ..localPath = chunk.localPath
        ..isReady = chunk.isReady;
    }).toList();
  }
}

class ChapterSpeechChunkModel {
  final String chunkId;
  final int order;
  final String label;
  final String text;
  final String localPath;
  final bool isReady;

  const ChapterSpeechChunkModel({
    required this.chunkId,
    required this.order,
    required this.label,
    required this.text,
    required this.localPath,
    required this.isReady,
  });
}