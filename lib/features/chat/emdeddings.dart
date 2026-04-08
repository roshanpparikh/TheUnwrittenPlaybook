import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Thin OpenAI embeddings client (client-side; dev only).
class OpenAIEmbeddings {
  OpenAIEmbeddings({
    required this.apiKey,
    this.model = 'text-embedding-3-small',
    this.baseUrl = 'https://api.openai.com/v1',
    this.timeout = const Duration(seconds: 20),
  });

  final String apiKey;
  final String model;
  final String baseUrl;
  final Duration timeout;

  Future<List<List<double>>> embed(List<String> texts) async {
    if (texts.isEmpty) return <List<double>>[];
    final uri = Uri.parse('$baseUrl/embeddings');

    final resp = await http
        .post(
          uri,
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'model': model, 'input': texts}),
        )
        .timeout(timeout);

    if (resp.statusCode != 200) {
      throw Exception(
        'OpenAI embeddings failed: ${resp.statusCode}\n${resp.body}',
      );
    }
    final json = jsonDecode(resp.body) as Map<String, dynamic>;
    final data =
        (json['data'] as List)
            .map<List<double>>(
              (row) =>
                  (row['embedding'] as List)
                      .map((e) => (e as num).toDouble())
                      .toList(),
            )
            .toList();
    return data;
  }

  /// Convenience: embed one string.
  Future<List<double>> embedOne(String text) async => (await embed([text]))[0];
}


const openAIKey = "";
