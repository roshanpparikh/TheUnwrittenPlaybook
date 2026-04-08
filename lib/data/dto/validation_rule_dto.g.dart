// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValidationRuleDto _$ValidationRuleDtoFromJson(Map<String, dynamic> json) =>
    _ValidationRuleDto(
      regex: json['regex'] as String?,
      errorText: json['errorText'] as String?,
    );

Map<String, dynamic> _$ValidationRuleDtoToJson(_ValidationRuleDto instance) =>
    <String, dynamic>{'regex': instance.regex, 'errorText': instance.errorText};
