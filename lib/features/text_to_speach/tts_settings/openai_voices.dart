import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_voice.dart';

enum OpenAiVoice implements TtsVoice {
  alloy,
  ash,
  ballad,
  coral,
  echo,
  fable,
  nova,
  onyx,
  sage,
  shimmer,
  verse,
  marin,
  cedar;

  @override
  String get title => name.replaceRange(0, 1, name[0].toUpperCase());

  @override
  String get providerId => provider;

  @override
  String get voiceId => name;

  @override
  String get identifier => '${providerId}_$voiceId';

  static const provider = 'openai';
}