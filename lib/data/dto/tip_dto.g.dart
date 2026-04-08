// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TipDto _$TipDtoFromJson(Map<String, dynamic> json) => _TipDto(
  type: json['type'] as String,
  label: json['label'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$TipDtoToJson(_TipDto instance) => <String, dynamic>{
  'type': instance.type,
  'label': instance.label,
  'content': instance.content,
};
