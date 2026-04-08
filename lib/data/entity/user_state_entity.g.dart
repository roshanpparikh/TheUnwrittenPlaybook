// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStateEntity _$UserStateEntityFromJson(Map<String, dynamic> json) =>
    _UserStateEntity(
      personalInfo: PersonalInfo.fromJson(
        json['personalInfo'] as Map<String, dynamic>,
      ),
      doneChapters:
          (json['doneChapters'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toSet() ??
          const <int>{},
      lastChapter: (json['lastChapter'] as num?)?.toInt(),
      recentChatTopics:
          (json['recentChatTopics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      ttsSetting: const TtsSettingsConverter().fromJson(
        json['ttsSetting'] as Map<String, dynamic>?,
      ),
      allowedToUseApp: json['allowedToUseApp'] ?? true,
    );

Map<String, dynamic> _$UserStateEntityToJson(_UserStateEntity instance) =>
    <String, dynamic>{
      'personalInfo': instance.personalInfo,
      'doneChapters': instance.doneChapters.toList(),
      'lastChapter': instance.lastChapter,
      'recentChatTopics': instance.recentChatTopics,
      'ttsSetting': const TtsSettingsConverter().toJson(instance.ttsSetting),
      'allowedToUseApp': instance.allowedToUseApp,
    };
