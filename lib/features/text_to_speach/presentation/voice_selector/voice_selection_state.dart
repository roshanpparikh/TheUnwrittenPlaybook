import 'package:freezed_annotation/freezed_annotation.dart';
import 'voice_preview_item.dart';

part 'voice_selection_state.freezed.dart';

@freezed
abstract class VoiceSelectionState with _$VoiceSelectionState {
  const VoiceSelectionState._();

  const factory VoiceSelectionState({
    required List<VoicePreviewItem> voices,
    VoicePreviewItem? selectedVoice,
    @Default(false) bool isSaving,
    String? error,
  }) = _VoiceSelectionState;

  factory VoiceSelectionState.initial(List<VoicePreviewItem> voices) =>
      VoiceSelectionState(voices: voices);
}
