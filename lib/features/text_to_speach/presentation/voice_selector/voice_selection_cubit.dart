
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/domain/use_cases/generate_speech_use_case.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/openai_voices.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_settings.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

import 'voice_preview_item.dart';
import 'voice_selection_state.dart';

class VoiceSelectionCubit extends Cubit<VoiceSelectionState> {
  final GenerateSpeechUseCase generateSpeechUseCase;
  final AudioPlayer player;
  final UserRepository userRepository;

  StreamSubscription<PlayerState>? _playerStateSub;

  VoiceSelectionCubit({
    required this.generateSpeechUseCase,
    required this.player,
    required this.userRepository
  }) : super(
    VoiceSelectionState.initial(
        OpenAiVoice.values.map((voice) {
          return VoicePreviewItem(
            voice: voice,
          );
        }).toList()
    ),
  );



  Future<void> selectVoice(VoicePreviewItem voicePreview) async {
    final item = _findVoice(voicePreview.voice);
    if (item == null) return;

    emit(state.copyWith(
      selectedVoice: voicePreview,
    ));

    if (item.isLoaded) {
      await _play(item);
      return;
    }

    await _loadAndPlay(item);
  }

  Future<void> _loadAndPlay(VoicePreviewItem item) async {
    _updateVoice(
      item.voice.identifier,
          (current) => current.copyWith(
        loading: true,
        error: null
      ),
    );

    try {
      final bytes = await generateSpeechUseCase.execute(
        text: "Hello ${userRepository.currentUser.value.name}, are you ready listening book ?",
        voice: item.voice,
      );

      final updatedVoice = _updateVoice(
        item.voice.identifier,
            (current) => current.copyWith(
          bytes: bytes,
          loading: false,
          error: null,
        ),
      );

      await _play(updatedVoice);
    } catch (e) {
      _updateVoice(
        item.voice.identifier,
            (current) => current.copyWith(
          loading: false,
          error: e.toString(),
        ),
      );

      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _play(VoicePreviewItem voice) async {
    if(voice.bytes == null || voice.bytes!.isEmpty) {
      return;
    }
    await player.stop();
    final source = BytesAudioSource(Uint8List.fromList(voice.bytes!));
    await player.setAudioSource(source);
    await player.play();
  }

  Future<void> stopPreview() async {
    await player.stop();
  }

  Future<bool> save() async {
    if(state.selectedVoice == null) return false;
    emit(state.copyWith(isSaving: true));
    await userRepository.saveTtsSetting(TtsSettings(voice: state.selectedVoice!.voice));
    emit(state.copyWith(isSaving: false));
    return true;
  }

  VoicePreviewItem? _findVoice(TtsVoice voice) {
    try {
      return state.voices.firstWhere((v) => v.voice.identifier == voice.identifier);
    } catch (_) {
      return null;
    }
  }

  VoicePreviewItem _updateVoice(
      String identifier,
      VoicePreviewItem Function(VoicePreviewItem current) transform,
      ) {
    late VoicePreviewItem updatedVoice;
    final updated = state.voices.map((voice) {
      if (voice.voice.identifier != identifier) return voice;
      updatedVoice = transform(voice);
      return updatedVoice;
    }).toList();

    emit(state.copyWith(voices: updated));
    return updatedVoice;
  }

  @override
  Future<void> close() async {
    await _playerStateSub?.cancel();
    await player.dispose();
    return super.close();
  }
}

class BytesAudioSource extends StreamAudioSource {
  final Uint8List bytes;
  final String contentType;

  BytesAudioSource(this.bytes, {this.contentType = 'audio/mpeg'});

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: contentType,
    );
  }
}