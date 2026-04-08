import 'package:flutter/cupertino.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

abstract final class TtsVoiceFactory {
  static TtsVoice? fromVoiceIdentifier(String voiceIdentifier) {
    final providerIdAndVoiceId = voiceIdentifier.split('_');
    if(providerIdAndVoiceId.length != 2) return null;
    try {
      switch (providerIdAndVoiceId.first) {
        case OpenAiVoice.provider:
          return OpenAiVoice.values.byName(providerIdAndVoiceId.last);
      }
    } catch (e, st) {
      debugPrintStack(label: e.toString(), stackTrace: st);
      return null;
    }
    return null;
  }
}