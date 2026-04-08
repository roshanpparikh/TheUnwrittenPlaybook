import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_rule_dto.freezed.dart';
part 'validation_rule_dto.g.dart';

@freezed
abstract class ValidationRuleDto with _$ValidationRuleDto {
  const factory ValidationRuleDto({
    String? regex,
    String? errorText,
  }) = _ValidationRuleDto;

  factory ValidationRuleDto.fromJson(Map<String, dynamic> json) =>
      _$ValidationRuleDtoFromJson(json);
}