import 'models/notification_settings.dart';

abstract interface class NotificationSettingsRepository {
  Future<NotificationSettings> getSettings();
  Future<void> setEnabled(bool enabled);
  Future<void> setTime(int hour, int minute);
  Future<bool> getPermissionDialogShown();
  Future<void> setPermissionDialogShown();
}
