abstract class TtsVoice {
  String get providerId;
  String get voiceId;

  String get identifier => '${providerId}_$voiceId';

  String get title;
}