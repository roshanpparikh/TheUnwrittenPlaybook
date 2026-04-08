import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/user_repository.dart';

import 'notification_service.dart';
import 'notification_cubit_state.dart';
import 'domain/daily_fact_repository.dart';
import 'domain/notification_settings_repository.dart';

class NotificationCubit extends Cubit<NotificationCubitState> {
  final NotificationSettingsRepository _settingsRepo;
  final DailyFactRepository _factRepo;
  final NotificationService _service;
  final UserRepository userRepository;

  NotificationCubit({
    required NotificationSettingsRepository settingsRepository,
    required DailyFactRepository factRepository,
    required NotificationService service,
    required this.userRepository,
  })  : _settingsRepo = settingsRepository,
        _factRepo = factRepository,
        _service = service,
        super(const NotificationCubitState(isLoading: true));

  Future<void> load() async {
    final settings = await _settingsRepo.getSettings();
    emit(NotificationCubitState(
      enabled: settings.enabled,
      hour: settings.hour,
      minute: settings.minute,
      isLoading: false
    ));
  }

  Future<void> setEnabled(bool value) async {
    if (value) {
      emit(state.copyWith(isLoading: true));
      final granted = await _service.requestPermissions();
      if (!granted) {
        emit(state.copyWith(isLoading: false, permissionDenied: true));
        return;
      }
    }

    await _settingsRepo.setEnabled(value);
    emit(state.copyWith(enabled: value, isLoading: false, permissionDenied: false));
    await _applySettings();
  }

  List<String> get _interests => userRepository.currentUser.value.personalInfo.interests;

  Future<void> setTime(int hour, int minute) async {
    await _settingsRepo.setTime(hour, minute);
    emit(state.copyWith(hour: hour, minute: minute));
    if (state.enabled) await _applySettings();
  }

  /// Called when the app resumes. If permission was previously denied and the
  /// user has since granted it in system Settings, enables and schedules the
  /// notification automatically.
  Future<void> refreshPermissionStatus() async {
    if (!state.permissionDenied) return;
    final granted = await _service.arePermissionsGranted();
    if (granted) {
      await _settingsRepo.setEnabled(true);
      emit(state.copyWith(enabled: true, permissionDenied: false));
      await _applySettings();
    }
  }

  Future<void> _applySettings() async {
    final settings = await _settingsRepo.getSettings();
    if (settings.enabled) {
      final notif = await _factRepo.factForToday(_interests);
      if (notif == null) return;
      final scheduled = notif.copyWith(hour: settings.hour, minute: settings.minute);
      await _factRepo.saveLastScheduledFact(scheduled.fact, scheduled.hour, scheduled.minute);
      await _service.scheduleDaily(scheduled);
    } else {
      await _service.cancel();
    }
  }
}
