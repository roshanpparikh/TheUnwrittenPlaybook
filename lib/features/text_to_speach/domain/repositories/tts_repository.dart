import 'package:upwork_the_unwritten_playbook/domain/models/chapter_content_model.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/models/tts_generation_progress.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

abstract class TtsRepository {
  Future<ChapterSpeech?> getStoredChapterSpeech({
    required String bookId,
    required String chapterId,
    required TtsVoice voice,
  });

  Future<ChapterSpeech> generateAndStoreChapterSpeech({
    required String bookId,
    required String chapterId,
    required List<ChapterSpeechChunk> chunks,
    required TtsVoice voice,
    void Function(TtsGenerationProgress progress)? onProgress,
  });

  Future<List<int>> generateSpeech({
    required String text,
    required TtsVoice voice,
  });

  Future<void> deleteChapterSpeech({
    required String bookId,
    required String chapterId,
    required TtsVoice voice,
  });

  Future<List<ChapterSpeech>> getAllChapterSpeeches({
    String? bookId,
    TtsVoice? voice,
  });
}