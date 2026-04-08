import 'package:shared_preferences/shared_preferences.dart';

import 'app_settings_local_data_source.dart';

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  static const _kThemeIsLight = 'app_settings.theme_is_light';

  final SharedPreferences prefs;

  AppSettingsLocalDataSourceImpl(this.prefs);

  @override
  Future<bool?> getThemeIsLight() async {
    // SharedPreferences returns null if the key doesn't exist.
    return prefs.getBool(_kThemeIsLight);
  }

  @override
  Future<void> setThemeIsLight(bool isLight) async {
    await prefs.setBool(_kThemeIsLight, isLight);
  }

  @override
  Future<void> clearTheme() async {
    await prefs.remove(_kThemeIsLight);
  }
}