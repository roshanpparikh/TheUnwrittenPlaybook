// lib/quiz/state/quiz_answer.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.freezed.dart';

@freezed
sealed class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer.single(String optionId) = SingleAnswer;
  const factory QuizAnswer.multi(Set<String> optionIds) = MultiAnswer;
  const factory QuizAnswer.text(String value) = TextAnswer;
  const factory QuizAnswer.scale(int value) = ScaleAnswer;
}