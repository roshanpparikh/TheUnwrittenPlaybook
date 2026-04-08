// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleQuestion _$SingleQuestionFromJson(Map<String, dynamic> json) =>
    SingleQuestion(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      explanation: json['explanation'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$SingleQuestionToJson(SingleQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'options': instance.options,
      'explanation': instance.explanation,
      'type': instance.$type,
    };

MultiQuestion _$MultiQuestionFromJson(Map<String, dynamic> json) =>
    MultiQuestion(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pick: (json['pick'] as num?)?.toInt() ?? 2,
      explanation: json['explanation'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MultiQuestionToJson(MultiQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'options': instance.options,
      'pick': instance.pick,
      'explanation': instance.explanation,
      'type': instance.$type,
    };

TextQuestion _$TextQuestionFromJson(Map<String, dynamic> json) => TextQuestion(
  id: json['id'] as String,
  prompt: json['prompt'] as String,
  validation: json['validation'] == null
      ? null
      : ValidationRuleDto.fromJson(json['validation'] as Map<String, dynamic>),
  minLength: (json['minLength'] as num?)?.toInt(),
  maxLength: (json['maxLength'] as num?)?.toInt(),
  placeholder: json['placeholder'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$TextQuestionToJson(TextQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'validation': instance.validation,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
      'placeholder': instance.placeholder,
      'type': instance.$type,
    };

ScaleQuestion _$ScaleQuestionFromJson(Map<String, dynamic> json) =>
    ScaleQuestion(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      min: (json['min'] as num?)?.toInt() ?? 1,
      max: (json['max'] as num?)?.toInt() ?? 5,
      step: (json['step'] as num?)?.toInt() ?? 1,
      minLabel: json['minLabel'] as String?,
      maxLabel: json['maxLabel'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScaleQuestionToJson(ScaleQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'min': instance.min,
      'max': instance.max,
      'step': instance.step,
      'minLabel': instance.minLabel,
      'maxLabel': instance.maxLabel,
      'type': instance.$type,
    };

ScenarioQuestion _$ScenarioQuestionFromJson(Map<String, dynamic> json) =>
    ScenarioQuestion(
      id: json['id'] as String,
      prompt: json['prompt'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      explanation: json['explanation'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ScenarioQuestionToJson(ScenarioQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'options': instance.options,
      'explanation': instance.explanation,
      'type': instance.$type,
    };
