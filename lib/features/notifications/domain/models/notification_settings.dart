import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_settings.freezed.dart';

@freezed
abstract class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(false) bool enabled,
    @Default(9) int hour,
    @Default(0) int minute,
  }) = _NotificationSettings;
}
