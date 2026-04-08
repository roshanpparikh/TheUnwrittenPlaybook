import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_option.freezed.dart';

@freezed
abstract class QuizOption with _$QuizOption {
  const factory QuizOption({
    required String id,
    required String text,
    // optional scoring / correctness if you want later:
    bool? isCorrect,
    int? score,
  }) = _QuizOption;
}
