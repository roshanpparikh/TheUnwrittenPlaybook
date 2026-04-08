import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/quiz_option_dto.dart';
import 'package:upwork_the_unwritten_playbook/data/dto/validation_rule_dto.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_option.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/quiz_question.dart';
import 'package:upwork_the_unwritten_playbook/domain/models/validation_rule.dart';

part 'quiz_question_dto.freezed.dart';
part 'quiz_question_dto.g.dart';

@Freezed(unionKey: 'type')
sealed class QuizQuestionDto with _$QuizQuestionDto {
  const QuizQuestionDto._();
  const factory QuizQuestionDto.single({
    required String id,
    required String prompt,
    required List<QuizOptionDto> options,
    String? explanation,
  }) = SingleQuestion;

  const factory QuizQuestionDto.multi({
    required String id,
    required String prompt,
    required List<QuizOptionDto> options,
    @Default(2) int pick,
    String? explanation,
  }) = MultiQuestion;

  const factory QuizQuestionDto.text({
    required String id,
    required String prompt,
    ValidationRuleDto? validation,
    int? minLength,
    int? maxLength,
    String? placeholder,
  }) = TextQuestion;

  const factory QuizQuestionDto.scale({
    required String id,
    required String prompt,
    @Default(1) int min,
    @Default(5) int max,
    @Default(1) int step,
    String? minLabel,
    String? maxLabel,
  }) = ScaleQuestion;

  const factory QuizQuestionDto.scenario({
    required String id,
    required String prompt,
    required List<QuizOptionDto> options,
    String? explanation,
  }) = ScenarioQuestion;

  factory QuizQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionDtoFromJson(json);

  QuizQuestion toModel() => map(
        single: (q) => QuizQuestion.single(
          id: q.id,
          prompt: q.prompt,
          options: q.options.map(_optionToModel).toList(),
          explanation: q.explanation,
        ),
        multi: (q) => QuizQuestion.multi(
          id: q.id,
          prompt: q.prompt,
          options: q.options.map(_optionToModel).toList(),
          pick: q.pick,
          explanation: q.explanation,
        ),
        text: (q) => QuizQuestion.text(
          id: q.id,
          prompt: q.prompt,
          validation: q.validation == null
              ? null
              : ValidationRule(
                  regex: q.validation!.regex,
                  errorText: q.validation!.errorText,
                ),
          minLength: q.minLength,
          maxLength: q.maxLength,
          placeholder: q.placeholder,
        ),
        scale: (q) => QuizQuestion.scale(
          id: q.id,
          prompt: q.prompt,
          min: q.min,
          max: q.max,
          step: q.step,
          minLabel: q.minLabel,
          maxLabel: q.maxLabel,
        ),
        scenario: (q) => QuizQuestion.scenario(
          id: q.id,
          prompt: q.prompt,
          options: q.options.map(_optionToModel).toList(),
          explanation: q.explanation,
        ),
      );

  static QuizOption _optionToModel(QuizOptionDto o) => QuizOption(
        id: o.id,
        text: o.text,
        isCorrect: o.isCorrect,
        score: o.score,
      );
}