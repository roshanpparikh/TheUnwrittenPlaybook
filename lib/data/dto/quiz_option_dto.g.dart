// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizOptionDto _$QuizOptionDtoFromJson(Map<String, dynamic> json) =>
    _QuizOptionDto(
      id: json['id'] as String,
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool?,
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizOptionDtoToJson(_QuizOptionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isCorrect': instance.isCorrect,
      'score': instance.score,
    };
