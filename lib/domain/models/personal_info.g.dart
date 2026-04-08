// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) =>
    _PersonalInfo(
      name: json['name'] as String? ?? '',
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      lifeStage: json['lifeStage'] as String?,
      field: json['field'] as String?,
      confidence: json['confidence'] as String?,
      interests:
          (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      faith: json['faith'] as String?,
      urgency: json['urgency'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(_PersonalInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender],
      'lifeStage': instance.lifeStage,
      'field': instance.field,
      'confidence': instance.confidence,
      'interests': instance.interests,
      'faith': instance.faith,
      'urgency': instance.urgency,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.nonbinary: 'nonbinary',
};
