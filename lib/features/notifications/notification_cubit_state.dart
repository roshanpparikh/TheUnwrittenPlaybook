import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_cubit_state.freezed.dart';

@freezed
abstract class NotificationCubitState with _$NotificationCubitState {
  const factory NotificationCubitState({
    @Default(false) bool enabled,
    @Default(9) int hour,
    @Default(0) int minute,
    @Default(false) bool isLoading,
    /// True when the user toggled notifications on but the OS denied permission.
    @Default(false) bool permissionDenied,
  }) = _NotificationCubitState;
}
