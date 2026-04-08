import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_rule.freezed.dart';

@freezed
abstract class ValidationRule with _$ValidationRule {
  const factory ValidationRule({
    String? regex, // e.g. "^[A-Za-z].{10,}$"
    String? errorText,
  }) = _ValidationRule;
}