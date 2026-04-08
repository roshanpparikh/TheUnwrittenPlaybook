import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/models/tts_generation_progress.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import '../repositories/tts_repository.dart';

class GenerateChapterSpeechUseCase {
  final TtsRepository repository;

  GenerateChapterSpeechUseCase(this.repository);

  Future<ChapterSpeech> execute({
    required String bookId,
    required String chapterId,
    required List<ChapterSpeechChunk> chunks,
    required TtsVoice voice,
    void Function(TtsGenerationProgress progress)? onProgress,
  }) {
    return repository.generateAndStoreChapterSpeech(
      bookId: bookId,
      chapterId: chapterId,
      chunks: chunks,
      voice: voice,
      onProgress: onProgress
    );
  }
}