import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/entities/domain_entity.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import '../repositories/tts_repository.dart';

class GenerateSpeechUseCase {
  final TtsRepository repository;

  GenerateSpeechUseCase(this.repository);

  Future<List<int>> execute({
    required String text,
    required TtsVoice voice,
  }) {
    return repository.generateSpeech(
      text: text,
      voice: voice,
    );
  }
}