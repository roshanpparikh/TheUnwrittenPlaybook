import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingsLocalSource {
  static const _kEnabled = 'notifications.enabled';
  static const _kHour = 'notifications.hour';
  static const _kMinute = 'notifications.minute';
  static const _kPermissionDialogShown = 'notifications.permission_dialog_shown';

  const NotificationSettingsLocalSource();

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  Future<bool> getEnabled() async {
    final p = await _prefs;
    return p.getBool(_kEnabled) ?? false;
  }

  Future<void> setEnabled(bool value) async {
    final p = await _prefs;
    await p.setBool(_kEnabled, value);
  }

  Future<int> getHour() async {
    final p = await _prefs;
    return p.getInt(_kHour) ?? 9;
  }

  Future<int> getMinute() async {
    final p = await _prefs;
    return p.getInt(_kMinute) ?? 0;
  }

  Future<void> setTime(int hour, int minute) async {
    final p = await _prefs;
    await p.setInt(_kHour, hour);
    await p.setInt(_kMinute, minute);
  }

  Future<bool> getPermissionDialogShown() async {
    final p = await _prefs;
    return p.getBool(_kPermissionDialogShown) ?? false;
  }

  Future<void> setPermissionDialogShown() async {
    final p = await _prefs;
    await p.setBool(_kPermissionDialogShown, true);
  }
}
