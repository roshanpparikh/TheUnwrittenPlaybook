abstract class AppSettingsLocalDataSource {
  /// null => system (not set)
  Future<bool?> getThemeIsLight();

  /// Save explicit theme.
  Future<void> setThemeIsLight(bool isLight);

  /// Removes stored value => system
  Future<void> clearTheme();
}