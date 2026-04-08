import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/router_delegate.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/domain/daily_fact_repository.dart';
import 'package:upwork_the_unwritten_playbook/features/notifications/notification/app_notification.dart';
import 'package:upwork_the_unwritten_playbook/presentation/notifications/daily_fact_dialog.dart';

final class NotificationTapDispatcher {
  NotificationTapDispatcher._();
  static final instance = NotificationTapDispatcher._();

  AppRouterDelegate? router;
  String? _pendingPayload;
  String? get pendingPayload => _pendingPayload;

  void attachRouter(AppRouterDelegate router) {
    this.router = router;

    final payload = _pendingPayload;
    if (payload != null) {
      _pendingPayload = null;
      _handlePayload(payload);
    }
  }

  void handle(String? payload) {
    if (router == null) {
      _pendingPayload = payload;
      return;
    }
    _handlePayload(payload);
  }

  void savePendingPayload(String? payload) {
    _pendingPayload = payload;
  }

  void _handlePayload(String? payload) {
    final router = this.router;
    if (router == null) return;

    final notification = AppNotification.fromPayload(payload);
    if (notification == null) return;

    switch (notification) {
      case DailyFactNotification():
        router.showAppDialog(DailyFactDialog(fact: notification.fact)).then((_) {
          DependencyProvider.get<DailyFactRepository>().factShown(notification.fact.id);
        });
    }
  }
}

void onNotificationTap(NotificationResponse response) {
  debugPrint('[NotificationTap] main isolate tap: ${response.payload}');
  NotificationTapDispatcher.instance.handle(response.payload);
}

@pragma('vm:entry-point')
void onBackgroundNotificationTap(NotificationResponse response) {
  debugPrint('[NotificationTap] background isolate tap: ${response.payload}');
  NotificationTapDispatcher.instance.savePendingPayload(response.payload);
}