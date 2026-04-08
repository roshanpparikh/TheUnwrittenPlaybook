// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValidationRule {

 String? get regex;// e.g. "^[A-Za-z].{10,}$"
 String? get errorText;
/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationRuleCopyWith<ValidationRule> get copyWith => _$ValidationRuleCopyWithImpl<ValidationRule>(this as ValidationRule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationRule&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.errorText, errorText) || other.errorText == errorText));
}


@override
int get hashCode => Object.hash(runtimeType,regex,errorText);

@override
String toString() {
  return 'ValidationRule(regex: $regex, errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class $ValidationRuleCopyWith<$Res>  {
  factory $ValidationRuleCopyWith(ValidationRule value, $Res Function(ValidationRule) _then) = _$ValidationRuleCopyWithImpl;
@useResult
$Res call({
 String? regex, String? errorText
});




}
/// @nodoc
class _$ValidationRuleCopyWithImpl<$Res>
    implements $ValidationRuleCopyWith<$Res> {
  _$ValidationRuleCopyWithImpl(this._self, this._then);

  final ValidationRule _self;
  final $Res Function(ValidationRule) _then;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? regex = freezed,Object? errorText = freezed,}) {
  return _then(_self.copyWith(
regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationRule].
extension ValidationRulePatterns on ValidationRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationRule value)  $default,){
final _that = this;
switch (_that) {
case _ValidationRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationRule value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationRule() when $default != null:
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
case _ValidationRule() when $default != null:
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
case _ValidationRule():
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
case _ValidationRule() when $default != null:
return $default(_that.regex,_that.errorText);case _:
  return null;

}
}

}

/// @nodoc


class _ValidationRule implements ValidationRule {
  const _ValidationRule({this.regex, this.errorText});
  

@override final  String? regex;
// e.g. "^[A-Za-z].{10,}$"
@override final  String? errorText;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationRuleCopyWith<_ValidationRule> get copyWith => __$ValidationRuleCopyWithImpl<_ValidationRule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationRule&&(identical(other.regex, regex) || other.regex == regex)&&(identical(other.errorText, errorText) || other.errorText == errorText));
}


@override
int get hashCode => Object.hash(runtimeType,regex,errorText);

@override
String toString() {
  return 'ValidationRule(regex: $regex, errorText: $errorText)';
}


}

/// @nodoc
abstract mixin class _$ValidationRuleCopyWith<$Res> implements $ValidationRuleCopyWith<$Res> {
  factory _$ValidationRuleCopyWith(_ValidationRule value, $Res Function(_ValidationRule) _then) = __$ValidationRuleCopyWithImpl;
@override @useResult
$Res call({
 String? regex, String? errorText
});




}
/// @nodoc
class __$ValidationRuleCopyWithImpl<$Res>
    implements _$ValidationRuleCopyWith<$Res> {
  __$ValidationRuleCopyWithImpl(this._self, this._then);

  final _ValidationRule _self;
  final $Res Function(_ValidationRule) _then;

/// Create a copy of ValidationRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? regex = freezed,Object? errorText = freezed,}) {
  return _then(_ValidationRule(
regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String?,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
