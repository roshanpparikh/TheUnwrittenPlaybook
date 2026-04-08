import '../domain/models/notification_settings.dart';
import '../domain/notification_settings_repository.dart';
import 'notification_settings_local_source.dart';

class NotificationSettingsRepositoryImpl implements NotificationSettingsRepository {
  final NotificationSettingsLocalSource _local;

  NotificationSettingsRepositoryImpl(this._local);

  @override
  Future<NotificationSettings> getSettings() async {
    final enabled = await _local.getEnabled();
    final hour = await _local.getHour();
    final minute = await _local.getMinute();
    return NotificationSettings(enabled: enabled, hour: hour, minute: minute);
  }

  @override
  Future<void> setEnabled(bool enabled) => _local.setEnabled(enabled);

  @override
  Future<void> setTime(int hour, int minute) => _local.setTime(hour, minute);

  @override
  Future<bool> getPermissionDialogShown() => _local.getPermissionDialogShown();

  @override
  Future<void> setPermissionDialogShown() => _local.setPermissionDialogShown();
}
