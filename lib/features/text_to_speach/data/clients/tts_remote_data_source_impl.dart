import 'package:upwork_the_unwritten_playbook/features/text_to_speach/data/clients/open_ai_client.dart';

import 'tts_remote_data_source.dart';

class TtsRemoteDataSourceImpl implements TtsRemoteDataSource {
  final OpenAiTtsClient client;

  TtsRemoteDataSourceImpl(this.client);

  @override
  Future<List<int>> synthesizeText({
    required String text,
    required String voiceId,
    required String format,
  }) async {
    final bytes = await client.synthesize(
      input: text,
      voice: voiceId,
      model: 'gpt-4o-mini-tts',
      format: format,
    );

    return bytes;
  }
}