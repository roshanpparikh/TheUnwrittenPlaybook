// lib/quiz/models/chapter_quiz.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_question.dart';

part 'chapter_quiz.freezed.dart';

@freezed
abstract class ChapterQuiz with _$ChapterQuiz {
  const factory ChapterQuiz({
    required int chapter,
    required String title,
    required List<QuizQuestion> questions,
  }) = _ChapterQuiz;

}
