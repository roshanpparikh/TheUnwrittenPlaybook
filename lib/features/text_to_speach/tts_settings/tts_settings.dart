import 'package:json_annotation/json_annotation.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice_factory.dart';

class TtsSettings {
  final TtsVoice voice;

  const TtsSettings({
    required this.voice,
  });

  static TtsSettings? fromJson(Map<String, dynamic> json) {
    final voiceIdentifier = json['voice'] as String?;
    if(voiceIdentifier == null) return null;
    final voice = TtsVoiceFactory.fromVoiceIdentifier(voiceIdentifier);
    if(voice == null) return null;
    return TtsSettings(
      voice: voice,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voice': voice.identifier,
    };
  }

  TtsSettings copyWith({
    TtsVoice? voice,
  }) {
    return TtsSettings(
      voice: voice ?? this.voice,
    );
  }

  @override
  String toString() => 'TtsSettings(voice: ${voice.identifier})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TtsSettings &&
        other.voice.identifier == voice.identifier;
  }

  @override
  int get hashCode => voice.identifier.hashCode;
}