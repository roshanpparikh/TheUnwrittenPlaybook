// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizAnswer {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizAnswer()';
}


}

/// @nodoc
class $QuizAnswerCopyWith<$Res>  {
$QuizAnswerCopyWith(QuizAnswer _, $Res Function(QuizAnswer) __);
}


/// Adds pattern-matching-related methods to [QuizAnswer].
extension QuizAnswerPatterns on QuizAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SingleAnswer value)?  single,TResult Function( MultiAnswer value)?  multi,TResult Function( TextAnswer value)?  text,TResult Function( ScaleAnswer value)?  scale,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SingleAnswer() when single != null:
return single(_that);case MultiAnswer() when multi != null:
return multi(_that);case TextAnswer() when text != null:
return text(_that);case ScaleAnswer() when scale != null:
return scale(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SingleAnswer value)  single,required TResult Function( MultiAnswer value)  multi,required TResult Function( TextAnswer value)  text,required TResult Function( ScaleAnswer value)  scale,}){
final _that = this;
switch (_that) {
case SingleAnswer():
return single(_that);case MultiAnswer():
return multi(_that);case TextAnswer():
return text(_that);case ScaleAnswer():
return scale(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SingleAnswer value)?  single,TResult? Function( MultiAnswer value)?  multi,TResult? Function( TextAnswer value)?  text,TResult? Function( ScaleAnswer value)?  scale,}){
final _that = this;
switch (_that) {
case SingleAnswer() when single != null:
return single(_that);case MultiAnswer() when multi != null:
return multi(_that);case TextAnswer() when text != null:
return text(_that);case ScaleAnswer() when scale != null:
return scale(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String optionId)?  single,TResult Function( Set<String> optionIds)?  multi,TResult Function( String value)?  text,TResult Function( int value)?  scale,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SingleAnswer() when single != null:
return single(_that.optionId);case MultiAnswer() when multi != null:
return multi(_that.optionIds);case TextAnswer() when text != null:
return text(_that.value);case ScaleAnswer() when scale != null:
return scale(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String optionId)  single,required TResult Function( Set<String> optionIds)  multi,required TResult Function( String value)  text,required TResult Function( int value)  scale,}) {final _that = this;
switch (_that) {
case SingleAnswer():
return single(_that.optionId);case MultiAnswer():
return multi(_that.optionIds);case TextAnswer():
return text(_that.value);case ScaleAnswer():
return scale(_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String optionId)?  single,TResult? Function( Set<String> optionIds)?  multi,TResult? Function( String value)?  text,TResult? Function( int value)?  scale,}) {final _that = this;
switch (_that) {
case SingleAnswer() when single != null:
return single(_that.optionId);case MultiAnswer() when multi != null:
return multi(_that.optionIds);case TextAnswer() when text != null:
return text(_that.value);case ScaleAnswer() when scale != null:
return scale(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class SingleAnswer implements QuizAnswer {
  const SingleAnswer(this.optionId);
  

 final  String optionId;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleAnswerCopyWith<SingleAnswer> get copyWith => _$SingleAnswerCopyWithImpl<SingleAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleAnswer&&(identical(other.optionId, optionId) || other.optionId == optionId));
}


@override
int get hashCode => Object.hash(runtimeType,optionId);

@override
String toString() {
  return 'QuizAnswer.single(optionId: $optionId)';
}


}

/// @nodoc
abstract mixin class $SingleAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory $SingleAnswerCopyWith(SingleAnswer value, $Res Function(SingleAnswer) _then) = _$SingleAnswerCopyWithImpl;
@useResult
$Res call({
 String optionId
});




}
/// @nodoc
class _$SingleAnswerCopyWithImpl<$Res>
    implements $SingleAnswerCopyWith<$Res> {
  _$SingleAnswerCopyWithImpl(this._self, this._then);

  final SingleAnswer _self;
  final $Res Function(SingleAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? optionId = null,}) {
  return _then(SingleAnswer(
null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MultiAnswer implements QuizAnswer {
  const MultiAnswer(final  Set<String> optionIds): _optionIds = optionIds;
  

 final  Set<String> _optionIds;
 Set<String> get optionIds {
  if (_optionIds is EqualUnmodifiableSetView) return _optionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_optionIds);
}


/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiAnswerCopyWith<MultiAnswer> get copyWith => _$MultiAnswerCopyWithImpl<MultiAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiAnswer&&const DeepCollectionEquality().equals(other._optionIds, _optionIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_optionIds));

@override
String toString() {
  return 'QuizAnswer.multi(optionIds: $optionIds)';
}


}

/// @nodoc
abstract mixin class $MultiAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory $MultiAnswerCopyWith(MultiAnswer value, $Res Function(MultiAnswer) _then) = _$MultiAnswerCopyWithImpl;
@useResult
$Res call({
 Set<String> optionIds
});




}
/// @nodoc
class _$MultiAnswerCopyWithImpl<$Res>
    implements $MultiAnswerCopyWith<$Res> {
  _$MultiAnswerCopyWithImpl(this._self, this._then);

  final MultiAnswer _self;
  final $Res Function(MultiAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? optionIds = null,}) {
  return _then(MultiAnswer(
null == optionIds ? _self._optionIds : optionIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

/// @nodoc


class TextAnswer implements QuizAnswer {
  const TextAnswer(this.value);
  

 final  String value;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextAnswerCopyWith<TextAnswer> get copyWith => _$TextAnswerCopyWithImpl<TextAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAnswer&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'QuizAnswer.text(value: $value)';
}


}

/// @nodoc
abstract mixin class $TextAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory $TextAnswerCopyWith(TextAnswer value, $Res Function(TextAnswer) _then) = _$TextAnswerCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$TextAnswerCopyWithImpl<$Res>
    implements $TextAnswerCopyWith<$Res> {
  _$TextAnswerCopyWithImpl(this._self, this._then);

  final TextAnswer _self;
  final $Res Function(TextAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(TextAnswer(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ScaleAnswer implements QuizAnswer {
  const ScaleAnswer(this.value);
  

 final  int value;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScaleAnswerCopyWith<ScaleAnswer> get copyWith => _$ScaleAnswerCopyWithImpl<ScaleAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScaleAnswer&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'QuizAnswer.scale(value: $value)';
}


}

/// @nodoc
abstract mixin class $ScaleAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory $ScaleAnswerCopyWith(ScaleAnswer value, $Res Function(ScaleAnswer) _then) = _$ScaleAnswerCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class _$ScaleAnswerCopyWithImpl<$Res>
    implements $ScaleAnswerCopyWith<$Res> {
  _$ScaleAnswerCopyWithImpl(this._self, this._then);

  final ScaleAnswer _self;
  final $Res Function(ScaleAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ScaleAnswer(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
