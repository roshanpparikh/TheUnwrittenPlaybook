import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/app_settings_repository.dart';
import 'package:upwork_the_unwritten_playbook/presentation/settings/app_settings_state.dart';


class AppSettingsCubit extends Cubit<AppSettingsState> {
  final AppSettingsRepository repo;

  AppSettingsCubit(this.repo) : super(const AppSettingsState());

  Future<void> load() async {
    final mode = await repo.getThemeMode();
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> toggleTheme() async {
    final current = state.themeMode;

    ThemeMode next;
    if (current == ThemeMode.system) {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      next = brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    } else {
      next = current == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    }

    emit(state.copyWith(themeMode: next));
    await repo.setThemeMode(next);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    await repo.setThemeMode(mode);
  }
}