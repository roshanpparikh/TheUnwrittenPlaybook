import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';
import 'voice_preview_status.dart';

part 'voice_preview_item.freezed.dart';

@freezed
abstract class VoicePreviewItem with _$VoicePreviewItem {
  const VoicePreviewItem._();

  const factory VoicePreviewItem({
    required TtsVoice voice,
    List<int>? bytes,
    @Default(false) bool loading,
    String? error,
  }) = _VoicePreviewItem;

  bool get isLoaded => bytes != null && bytes!.isNotEmpty;
}
