import 'dart:convert';

import 'package:upwork_the_unwritten_playbook/features/notifications/data/daily_fact.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification/enum_app_notification_type.dart';

part 'daily_fact_notification.dart';

sealed class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
  });

  final int id;
  final AppNotificationType type;
   String get title;
   String get body;

  String toPayload();

  static AppNotification? fromPayload(String? payload) {
    if (payload == null) return null;
    try {
      final map = jsonDecode(payload) as Map<String, dynamic>;
      switch (map['type'] as String?) {
        case 'dailyFact':
          return  DailyFactNotification.fromPayload(
            payload
          );
        default:
          return null;
      }
    } catch (_) {
      return null;
    }
  }
}