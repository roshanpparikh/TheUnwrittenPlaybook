// lib/quiz/models/chapter_quiz.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/quiz_question_dto.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/chapter_quiz.dart';

part 'chapter_quiz_dto.freezed.dart';
part 'chapter_quiz_dto.g.dart';

@freezed
abstract class ChapterQuizDto with _$ChapterQuizDto {
  const ChapterQuizDto._();
  const factory ChapterQuizDto({
    required int chapter,
    required String title,
    required List<QuizQuestionDto> questions,
  }) = _ChapterQuizDto;

  factory ChapterQuizDto.fromJson(Map<String, dynamic> json) =>
      _$ChapterQuizDtoFromJson(json);

  ChapterQuiz toModel() => ChapterQuiz(
      chapter: chapter,
      title: title,
    questions: questions.map((q) => q.toModel()).toList()
  );
}
