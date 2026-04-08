import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/personal_info.dart';
import 'package:upwork_the_unwritten_playbook/features/text_to_speach/tts_settings/tts_settings.dart';

part 'user_state_entity.freezed.dart';
part 'user_state_entity.g.dart';

@freezed
abstract class UserStateEntity with _$UserStateEntity {
  const factory UserStateEntity({
    required PersonalInfo personalInfo,
    @Default(<int>{}) Set<int> doneChapters,
    int? lastChapter,
    @Default(<String>[]) List<String> recentChatTopics,
    @TtsSettingsConverter() TtsSettings? ttsSetting,
    @Default(true) allowedToUseApp
  }) = _UserStateEntity;

  const UserStateEntity._();

  factory UserStateEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStateEntityFromJson(json);
}


class TtsSettingsConverter implements JsonConverter<TtsSettings?, Map<String,dynamic>?> {
  const TtsSettingsConverter();

  @override
  TtsSettings? fromJson(Map<String, dynamic>? json) {
    if(json == null) return null;
    return TtsSettings.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TtsSettings? object) {
    if(object == null) return null;
    return object.toJson();
  }
}