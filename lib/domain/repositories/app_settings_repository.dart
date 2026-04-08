import 'package:flutter/material.dart';

abstract class AppSettingsRepository {
  Future<ThemeMode> getThemeMode();

  /// Persist theme mode.
  /// - ThemeMode.system => clears saved value
  /// - light/dark => saves bool
  Future<void> setThemeMode(ThemeMode mode);
}