import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';

abstract class TtsLocalDataSource {
  Future<ChapterSpeech?> getChapterSpeech({
    required String bookId,
    required String chapterId,
    required String voice,
  });

  Future<ChapterSpeechChunk?> getChunk({
    required String speechId,
    required String chunkId,
  });

  Future<void> saveChapterSpeech(ChapterSpeech speech);

  Future<void> saveChunk({
    required String chapterId,
    required String bookId,
    required String speechId,
    required ChapterSpeechChunk chunk,
  });

  Future<void> deleteChapterSpeech({
    required String bookId,
    required String chapterId,
    required String voice,
  });

  Future<List<ChapterSpeech>> getAllChapterSpeeches({
    String? bookId,
    String? voiceIdentifier,
  });
}