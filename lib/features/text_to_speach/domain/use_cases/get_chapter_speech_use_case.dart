import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import '../repositories/tts_repository.dart';

class GetChapterSpeechUseCase {
  final TtsRepository repository;

  GetChapterSpeechUseCase(this.repository);

  Future<ChapterSpeech?> execute({
    required String bookId,
    required String chapterId,
    required TtsVoice voice,
  }) {
    return repository.getStoredChapterSpeech(
      bookId: bookId,
      chapterId: chapterId,
      voice: voice,
    );
  }
}