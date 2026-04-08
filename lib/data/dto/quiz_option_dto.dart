import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_option_dto.freezed.dart';
part 'quiz_option_dto.g.dart';

@freezed
abstract class QuizOptionDto with _$QuizOptionDto {
  const QuizOptionDto._();
  const factory QuizOptionDto({
    required String id,
    required String text,
    // optional scoring / correctness if you want later:
    bool? isCorrect,
    int? score,
  }) = _QuizOptionDto;

  factory QuizOptionDto.fromJson(Map<String, dynamic> json) =>
      _$QuizOptionDtoFromJson(json);
}
