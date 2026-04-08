import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_the_unwritten_playbook/data/dto/tip_dto.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/tip_model.dart';
import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_isar.dart';

import 'remote_tip_source.dart';

class RemoteTipSourceImpl implements RemoteTipSource {
  final http.Client _httpClient;
  final String _apiKey;

  const RemoteTipSourceImpl({
    required http.Client httpClient,
    required String apiKey,
  })  : _httpClient = httpClient,
        _apiKey = apiKey;

  static const _model = 'gpt-4o';

  static const _systemPrompt =
      'You are a business coach assistant. Generate exactly 4 actionable tips for each type: tip, insight, wisdom, keyPrinciple'
      'or insights based on the provided chapter content. '
      'Respond ONLY with a valid JSON object — no markdown, no code fences. '
      'Format:\n'
      '{"tips":[{"type":"tip","label":"Short Title","content":"2-3 sentence tip."}]}\n'
      'Use variety in "type": "tip", "snsight", "wisdom", or "keyPrinciple".';

  @override
  Future<List<TipDto>> generateTips(String chapterText) async {
    final response = await _httpClient.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': _model,
        'response_format': {'type': 'json_object'},
        'messages': [
          {'role': 'system', 'content': _systemPrompt},
          {'role': 'user', 'content': chapterText},
        ],
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
          'Tips generation failed: ${response.statusCode} ${response.body}');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    final content =
        body['choices'][0]['message']['content'] as String;
    final parsed = jsonDecode(content) as Map<String, dynamic>;
    final tipsList = parsed['tips'] as List<dynamic>;

    return tipsList.map((e) {
      final m = e as Map<String, dynamic>;
      return TipDto(
        type: m['type'] as String,
        label: m['label'] as String,
        content: m['content'] as String,
      );
    }).toList();
  }
}
