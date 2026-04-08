import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_dto.freezed.dart';
part 'tip_dto.g.dart';

@freezed
abstract class TipDto with _$TipDto {
  const factory TipDto({
    required String type,
    required String label,
    required String content,
  }) = _TipDto;

  const TipDto._();

  factory TipDto.fromJson(Map<String, dynamic> json) =>
      _$TipDtoFromJson(json);
}