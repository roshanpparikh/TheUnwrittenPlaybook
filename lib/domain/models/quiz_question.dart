import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_option.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/validation_rule.dart';

part 'quiz_question.freezed.dart';

@Freezed(unionKey: 'type')
sealed class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion.single({
    required String id,
    required String prompt,
    required List<QuizOption> options,
    String? explanation,
  }) = SingleQuestion;

  const factory QuizQuestion.multi({
    required String id,
    required String prompt,
    required List<QuizOption> options,
    @Default(2) int pick,
    String? explanation,
  }) = MultiQuestion;

  const factory QuizQuestion.text({
    required String id,
    required String prompt,
    ValidationRule? validation,
    int? minLength,
    int? maxLength,
    String? placeholder,
  }) = TextQuestion;

  const factory QuizQuestion.scale({
    required String id,
    required String prompt,
    @Default(1) int min,
    @Default(5) int max,
    @Default(1) int step,
    String? minLabel,
    String? maxLabel,
  }) = ScaleQuestion;

  const factory QuizQuestion.scenario({
    required String id,
    required String prompt,
    required List<QuizOption> options,
    String? explanation,
  }) = ScenarioQuestion;
}