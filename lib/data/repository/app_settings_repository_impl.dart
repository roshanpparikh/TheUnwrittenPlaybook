import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/data/source/app_settings_local_data_source.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/app_settings_repository.dart';


class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsLocalDataSource local;

  AppSettingsRepositoryImpl({required this.local});

  @override
  Future<ThemeMode> getThemeMode() async {
    final isLight = await local.getThemeIsLight();
    if (isLight == null) return ThemeMode.system;
    return isLight ? ThemeMode.light : ThemeMode.dark;
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    switch (mode) {
      case ThemeMode.system:
        await local.clearTheme();
        return;
      case ThemeMode.light:
        await local.setThemeIsLight(true);
        return;
      case ThemeMode.dark:
        await local.setThemeIsLight(false);
        return;
    }
  }
}