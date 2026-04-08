import 'package:flutter_native_timezone_latest/flutter_native_timezone_latest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'package:upwork_the_unwritten_playbook/features/notifications/notification_tap_dispatcher.dart';

import 'notification/app_notification.dart';

class NotificationService {
  static const _channelId = 'daily_playbook_tip';
  static const _channelName = 'Daily Playbook Tips';

  final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  NotificationService();

  void _log(String message) {
    debugPrint('[NotificationService] $message');
  }

   Future<NotificationResponse?> getNotificationResponseAppLaunch() async {
    await _ensureInitialized();
    final NotificationAppLaunchDetails? details = await _plugin.getNotificationAppLaunchDetails();
    if(details == null) return null;
    
    return details.notificationResponse;
   } 

  Future<void> initialize() async {
    if (_initialized) {
      _log('initialize() skipped: already initialized');
      return;
    }

    _log('initialize() started');

    tz_data.initializeTimeZones();
    _log('Time zones initialized');

    try {
      final rawTimeZoneName =
      await FlutterNativeTimezoneLatest.getLocalTimezone();
      _log('Device timezone from platform: $rawTimeZoneName');

      final normalizedTimeZoneName = _normalizeTimeZone(rawTimeZoneName);
      _log('Normalized timezone: $normalizedTimeZoneName');

      final location = tz.getLocation(normalizedTimeZoneName);
      tz.setLocalLocation(location);

      _log('tz.local after setLocalLocation: ${tz.local.name}');
    } catch (e, st) {
      _log('Failed to set local timezone: $e');
      _log('$st');

      tz.setLocalLocation(tz.getLocation('UTC'));
      _log('Fallback tz.local: ${tz.local.name}');
    }

    const androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: onBackgroundNotificationTap,
    );

    _initialized = true;
    _log('FlutterLocalNotificationsPlugin initialized');
  }

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    _log('_ensureInitialized(): service not initialized, initializing now');
    await initialize();
  }

  Future<void> scheduleDaily(DailyFactNotification notif) async {
    await _ensureInitialized();

    _log(
      'scheduleDaily() started with hour=${notif.hour}, minute=${notif.minute}',
    );

    await _plugin.cancelAll();
    _log('Existing notifications cancelled');

    _log(
      'Fact selected: id=${notif.id}, title="${notif.title}", body="${notif.body}"',
    );

    final now = tz.TZDateTime.now(tz.local);
    _log('Current local time: $now');
    _log('Current local timezone: ${tz.local.name}');

    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      notif.hour,
      notif.minute,
    );

    _log('Initial scheduled time: $scheduled');

    if (scheduled.isBefore(now)) {
      _log('Scheduled time is before now, moving to next day');
      scheduled = scheduled.add(const Duration(days: 1));
    }

    _log('Final scheduled time: $scheduled');

    await _plugin.zonedSchedule(
      notif.id,
      notif.title,
      notif.body,
      scheduled,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(notif.body),
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: notif.toPayload(),
    );

    _log(
      'Notification scheduled successfully: id=${notif.id}, nextTrigger=$scheduled',
    );
  }

  Future<void> cancel() async {
    await _ensureInitialized();
    _log('cancel() started');
    await _plugin.cancelAll();
    _log('All notifications cancelled');
  }

  Future<bool> requestPermissions() async {
    _log('requestPermissions() started');

    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    _log('iOS plugin available: ${ios != null}');
    _log('Android plugin available: ${android != null}');

    final iosGranted = await ios?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    ) ??
        false;

    _log('iOS permission granted: $iosGranted');

    final androidGranted =
        await android?.requestNotificationsPermission() ?? false;

    _log('Android permission granted: $androidGranted');

    final result = iosGranted || androidGranted;
    _log('requestPermissions() result: $result');

    return result;
  }

  /// Returns the pending daily fact notification if one is scheduled.
  /// The payload is decoded so callers can inspect the fact and scheduled time.
  Future<DailyFactNotification?> getPendingDailyFact() async {
    await _ensureInitialized();
    final pending = await _plugin.pendingNotificationRequests();
    if (pending.isEmpty) return null;
    final payload = pending.first.payload;
    if (payload == null) return null;
    try {
      return DailyFactNotification.fromPayload(payload);
    } catch (_) {
      return null;
    }
  }

  /// Checks the current permission status without prompting the user.
  /// Returns true if notifications are enabled at the OS level.
  Future<bool> arePermissionsGranted() async {
    _log('arePermissionsGranted() started');

    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final options = await ios.checkPermissions();
      final result = options?.isEnabled ?? false;
      _log(
        'iOS permissions: alert=${options?.isAlertEnabled}, '
            'badge=${options?.isBadgeEnabled}, '
            'sound=${options?.isSoundEnabled}, '
            'enabled=$result',
      );
      return result;
    }

    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final result = await android.areNotificationsEnabled() ?? false;
      _log('Android notifications enabled: $result');
      return result;
    }

    _log('No platform-specific notification plugin available');
    return false;
  }
}

String _normalizeTimeZone(String name) {
  switch (name) {
    case 'Europe/Kiev':
      return 'Europe/Kyiv';
    default:
      return name;
  }
}