import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class OpenAiTtsClient {
  final http.Client httpClient;
  final String apiKey;

  OpenAiTtsClient({
    required this.httpClient,
    required this.apiKey,
  });

  Future<Uint8List> synthesize({
    required String input,
    required String voice,
    required String model,
    required String format,
  }) async {
    final response = await httpClient.post(
      Uri.parse('https://api.openai.com/v1/audio/speech'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': model,
        'voice': voice,
        'input': input,
        'format': format,
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('TTS request failed: ${response.statusCode} ${response.body}');
    }

    return response.bodyBytes;
  }
}