import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:upwork_the_unwritten_playbook/isar/embedded_chunk_repository.dart';


import 'emdeddings.dart';

class SendChatMessageUseCase {
  final EmbeddedChunkRepository _chunkRepository;
  final OpenAIEmbeddings _embeddings;

  static const _openAIChatUrl = 'https://api.openai.com/v1/chat/completions';

  SendChatMessageUseCase({
    required EmbeddedChunkRepository chunkRepository,
    required OpenAIEmbeddings embeddings,
  })  : _chunkRepository = chunkRepository,
        _embeddings = embeddings;

  Future<String?> execute({
    required String userMessage,
    List<Map<String, String>> chatMemory = const [],
    String? chapterId
  }) async {
    final queryEmbedding = await _embeddings.embedOne(userMessage);

    final chunks = await _chunkRepository.searchTopK(
      queryEmbedding: queryEmbedding,
      topK: 5,
      chapterId: chapterId
    );

    final notes = chunks.map((c) => c.text.trim()).where((e) => e.isNotEmpty).toList();

    final system = [
      "You are the in-app guide for The Unwritten Playbook.",
      "Your role is to help the user understand, reflect on, and apply ideas from the book in a practical, thoughtful, and grounded way.",
      "Speak in a calm, intelligent, discreet, and encouraging tone.",
      "Do not roleplay as the book's author, and do not claim personal life experience.",
      "Base your answer primarily on the provided book context when relevant.",
      "If the context is insufficient, be honest and give a helpful general response without inventing book content.",
      "Keep answers concise but meaningful: usually 3-6 sentences.",
      "When helpful, include one practical takeaway or one reflection question.",
      "Do not sound like a generic motivational coach.",
      "Do not use excessive hype, slang, or theatrical language.",
      "If the user asks about status, relationships, confidence, reputation, networking, style, money, discipline, or social behavior, connect the answer back to principles and judgment rather than manipulation.",
      "Prefer clarity, nuance, and real-world application.",
      "Respond in the same language as the user's message, English prefered.",
    ].join(" ");

    final notesBlock = notes.isEmpty
        ? ""
        : "Relevant book context:\n- ${notes.join("\n- ")}";

    final recentMemory = chatMemory.length > 5
        ? chatMemory.sublist(chatMemory.length - 5)
        : chatMemory;

    final userPrompt = jsonEncode({
      "userInput": userMessage,
      "recentMessages": recentMemory,
      "instruction":
          "Answer the user as a companion to The Unwritten Playbook. Use the provided context when relevant, but do not fabricate details that are not supported by it.",
    });

    try {
      final response = await http.post(
        Uri.parse(_openAIChatUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${_embeddings.apiKey}',
        },
        body: jsonEncode({
          'model': 'gpt-4o',
          'messages': [
            {
              'role': 'system',
              'content': notesBlock.isEmpty ? system : '$system\n\n$notesBlock',
            },
            {
              'role': 'user',
              'content': userPrompt,
            },
          ],
          'temperature': 0.6,
        }),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return decoded['choices'][0]['message']['content'] as String?;
      } else {
        debugPrint('SendChatMessageUseCase error: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('SendChatMessageUseCase exception: $e');
      return null;
    }
  }
}