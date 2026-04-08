// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterQuizDto _$ChapterQuizDtoFromJson(Map<String, dynamic> json) =>
    _ChapterQuizDto(
      chapter: (json['chapter'] as num).toInt(),
      title: json['title'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterQuizDtoToJson(_ChapterQuizDto instance) =>
    <String, dynamic>{
      'chapter': instance.chapter,
      'title': instance.title,
      'questions': instance.questions,
    };
