// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_option_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizOptionDto {

 String get id; String get text;// optional scoring / correctness if you want later:
 bool? get isCorrect; int? get score;
/// Create a copy of QuizOptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizOptionDtoCopyWith<QuizOptionDto> get copyWith => _$QuizOptionDtoCopyWithImpl<QuizOptionDto>(this as QuizOptionDto, _$identity);

  /// Serializes this QuizOptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizOptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isCorrect,score);

@override
String toString() {
  return 'QuizOptionDto(id: $id, text: $text, isCorrect: $isCorrect, score: $score)';
}


}

/// @nodoc
abstract mixin class $QuizOptionDtoCopyWith<$Res>  {
  factory $QuizOptionDtoCopyWith(QuizOptionDto value, $Res Function(QuizOptionDto) _then) = _$QuizOptionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String text, bool? isCorrect, int? score
});




}
/// @nodoc
class _$QuizOptionDtoCopyWithImpl<$Res>
    implements $QuizOptionDtoCopyWith<$Res> {
  _$QuizOptionDtoCopyWithImpl(this._self, this._then);

  final QuizOptionDto _self;
  final $Res Function(QuizOptionDto) _then;

/// Create a copy of QuizOptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? text = null,Object? isCorrect = freezed,Object? score = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizOptionDto].
extension QuizOptionDtoPatterns on QuizOptionDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizOptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizOptionDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizOptionDto value)  $default,){
final _that = this;
switch (_that) {
case _QuizOptionDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizOptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuizOptionDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String text,  bool? isCorrect,  int? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizOptionDto() when $default != null:
return $default(_that.id,_that.text,_that.isCorrect,_that.score);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String text,  bool? isCorrect,  int? score)  $default,) {final _that = this;
switch (_that) {
case _QuizOptionDto():
return $default(_that.id,_that.text,_that.isCorrect,_that.score);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String text,  bool? isCorrect,  int? score)?  $default,) {final _that = this;
switch (_that) {
case _QuizOptionDto() when $default != null:
return $default(_that.id,_that.text,_that.isCorrect,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizOptionDto extends QuizOptionDto {
  const _QuizOptionDto({required this.id, required this.text, this.isCorrect, this.score}): super._();
  factory _QuizOptionDto.fromJson(Map<String, dynamic> json) => _$QuizOptionDtoFromJson(json);

@override final  String id;
@override final  String text;
// optional scoring / correctness if you want later:
@override final  bool? isCorrect;
@override final  int? score;

/// Create a copy of QuizOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizOptionDtoCopyWith<_QuizOptionDto> get copyWith => __$QuizOptionDtoCopyWithImpl<_QuizOptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizOptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizOptionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text,isCorrect,score);

@override
String toString() {
  return 'QuizOptionDto(id: $id, text: $text, isCorrect: $isCorrect, score: $score)';
}


}

/// @nodoc
abstract mixin class _$QuizOptionDtoCopyWith<$Res> implements $QuizOptionDtoCopyWith<$Res> {
  factory _$QuizOptionDtoCopyWith(_QuizOptionDto value, $Res Function(_QuizOptionDto) _then) = __$QuizOptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String text, bool? isCorrect, int? score
});




}
/// @nodoc
class __$QuizOptionDtoCopyWithImpl<$Res>
    implements _$QuizOptionDtoCopyWith<$Res> {
  __$QuizOptionDtoCopyWithImpl(this._self, this._then);

  final _QuizOptionDto _self;
  final $Res Function(_QuizOptionDto) _then;

/// Create a copy of QuizOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? text = null,Object? isCorrect = freezed,Object? score = freezed,}) {
  return _then(_QuizOptionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isCorrect: freezed == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
