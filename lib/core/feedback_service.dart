import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';

class FeedbackService {
  FeedbackService._();

  static final FeedbackService instance = FeedbackService._();

  Future<void> submitTrelloFeedback(
    BuildContext context, {
    required UserFeedback feedback,
  }) async {
    final appBloc = context.read<AppBloc>();
    final currentPage = appBloc.getCurrentPageConfiguration?.call();

    final screenName = currentPage?.path ?? "";

    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    final cardTitle = _buildCardTitle(
      message: feedback.text,
      screenName: screenName,
    );

    final cardDescription = _buildCardDescription(
      message: feedback.text,
      userId: appBloc.state.userState.firebaseId ?? "",
      screenName: screenName,
      appVersion: appVersion,
      buildNumber: buildNumber,
    );

    final cardId = await _createCard(
      title: cardTitle,
      description: cardDescription,
    );

    if (feedback.screenshot.isNotEmpty) {
      await _attachScreenshot(
        cardId: cardId,
        screenshotBytes: feedback.screenshot,
      );
    }
  }

  Future<String> _createCard({
    required String title,
    required String description,
  }) async {
    final uri = Uri.https('api.trello.com', '/1/cards', {
      'key': trelloApiKey,
      'token': trelloToken,
    });

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'idList': trelloListId,
        'name': title,
        'desc': description,
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to create Trello card: ${response.statusCode} ${response.body}',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final cardId = json['id'] as String?;

    if (cardId == null || cardId.isEmpty) {
      throw Exception('Trello card created but id is missing');
    }

    return cardId;
  }

  Future<void> _attachScreenshot({
    required String cardId,
    required Uint8List screenshotBytes,
  }) async {
    final uri = Uri.parse(
      'https://api.trello.com/1/cards/$cardId/attachments'
      '?key=$trelloApiKey&token=$trelloToken',
    );

    final request = http.MultipartRequest('POST', uri)
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          screenshotBytes,
          filename: 'feedback_screenshot.png',
        ),
      );

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to attach screenshot: ${response.statusCode} $body',
      );
    }
  }

  String _buildCardTitle({
    required String message,
    required String screenName,
  }) {
    final trimmed = message.trim();
    final firstLine = trimmed.isEmpty
        ? 'Feedback'
        : trimmed.split('\n').first.trim();

    final shortText = firstLine.length > 60
        ? '${firstLine.substring(0, 60)}...'
        : firstLine;

    return '[$screenName] $shortText';
  }

  String _buildCardDescription({
    required String message,
    required String userId,
    required String screenName,
    required String appVersion,
    required String buildNumber,
  }) {
    return '''
Message:
$message

User ID: $userId
Screen: $screenName
App version: $appVersion+$buildNumber
''';
  }
}

class FeedbackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const FeedbackButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          onTap ??
          () {
            BetterFeedback.of(context).show((feedback) async {
              await FeedbackService.instance.submitTrelloFeedback(
                context,
                feedback: feedback,
              );
            });
          },
      icon: Icon(Icons.bug_report),
    );
  }
}

const trelloApiKey = "";
const trelloApiSecret =
    "";
const trelloToken =
    "";
const boardId = "";

const trelloListId = "";

class TrelloService {
  TrelloService({
    required this.apiKey,
    required this.token,
    required this.listId,
  });

  final String apiKey;
  final String token;
  final String listId;

  Future<void> createFeedbackCard({
    required String title,
    required String description,
  }) async {
    final uri = Uri.https('api.trello.com', '/1/cards', {
      'key': apiKey,
      'token': token,
    });

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idList': listId, 'name': title, 'desc': description}),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to create Trello card: ${response.statusCode} ${response.body}',
      );
    }
  }
}
