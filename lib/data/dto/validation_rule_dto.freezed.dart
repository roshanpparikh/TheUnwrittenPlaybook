// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValidationRuleDto {

 String? get regex; String? get errorText;
/// Create a copy of ValidationRuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationRuleDtoCopyWith<ValidationRuleDto> get copyWith => _$ValidationRuleDtoCopyWithImpl<ValidationRuleDto>(this as ValidationRuleDto, _$identity);

  /// Serializes this ValidationRuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationRuleDto&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.errorText, errorText) || other.errorText == errorText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,regex,errorText);

@override
String toString() {
  return 'ValidationRuleDto(regex: $regex, errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class $ValidationRuleDtoCopyWith<$Res>  {
  factory $ValidationRuleDtoCopyWith(ValidationRuleDto value, $Res Function(ValidationRuleDto) _then) = _$ValidationRuleDtoCopyWithImpl;
@useResult
$Res call({
 String? regex, String? errorText
});




}
/// @nodoc
class _$ValidationRuleDtoCopyWithImpl<$Res>
    implements $ValidationRuleDtoCopyWith<$Res> {
  _$ValidationRuleDtoCopyWithImpl(this._self, this._then);

  final ValidationRuleDto _self;
  final $Res Function(ValidationRuleDto) _then;

/// Create a copy of ValidationRuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? regex = freezed,Object? errorText = freezed,}) {
  return _then(_self.copyWith(
regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationRuleDto].
extension ValidationRuleDtoPatterns on ValidationRuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationRuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationRuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationRuleDto value)  $default,){
final _that = this;
switch (_that) {
case _ValidationRuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationRuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationRuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? regex,  String? errorText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationRuleDto() when $default != null:
return $default(_that.regex,_that.errorText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? regex,  String? errorText)  $default,) {final _that = this;
switch (_that) {
case _ValidationRuleDto():
return $default(_that.regex,_that.errorText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? regex,  String? errorText)?  $default,) {final _that = this;
switch (_that) {
case _ValidationRuleDto() when $default != null:
return $default(_that.regex,_that.errorText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationRuleDto implements ValidationRuleDto {
  const _ValidationRuleDto({this.regex, this.errorText});
  factory _ValidationRuleDto.fromJson(Map<String, dynamic> json) => _$ValidationRuleDtoFromJson(json);

@override final  String? regex;
@override final  String? errorText;

/// Create a copy of ValidationRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationRuleDtoCopyWith<_ValidationRuleDto> get copyWith => __$ValidationRuleDtoCopyWithImpl<_ValidationRuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationRuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationRuleDto&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.errorText, errorText) || other.errorText == errorText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,regex,errorText);

@override
String toString() {
  return 'ValidationRuleDto(regex: $regex, errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class _$ValidationRuleDtoCopyWith<$Res> implements $ValidationRuleDtoCopyWith<$Res> {
  factory _$ValidationRuleDtoCopyWith(_ValidationRuleDto value, $Res Function(_ValidationRuleDto) _then) = __$ValidationRuleDtoCopyWithImpl;
@override @useResult
$Res call({
 String? regex, String? errorText
});




}
/// @nodoc
class __$ValidationRuleDtoCopyWithImpl<$Res>
    implements _$ValidationRuleDtoCopyWith<$Res> {
  __$ValidationRuleDtoCopyWithImpl(this._self, this._then);

  final _ValidationRuleDto _self;
  final $Res Function(_ValidationRuleDto) _then;

/// Create a copy of ValidationRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? regex = freezed,Object? errorText = freezed,}) {
  return _then(_ValidationRuleDto(
regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
