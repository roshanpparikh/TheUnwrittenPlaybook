// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterQuizDto {

 int get chapter; String get title; List<QuizQuestionDto> get questions;
/// Create a copy of ChapterQuizDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterQuizDtoCopyWith<ChapterQuizDto> get copyWith => _$ChapterQuizDtoCopyWithImpl<ChapterQuizDto>(this as ChapterQuizDto, _$identity);

  /// Serializes this ChapterQuizDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterQuizDto&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter,title,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'ChapterQuizDto(chapter: $chapter, title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $ChapterQuizDtoCopyWith<$Res>  {
  factory $ChapterQuizDtoCopyWith(ChapterQuizDto value, $Res Function(ChapterQuizDto) _then) = _$ChapterQuizDtoCopyWithImpl;
@useResult
$Res call({
 int chapter, String title, List<QuizQuestionDto> questions
});




}
/// @nodoc
class _$ChapterQuizDtoCopyWithImpl<$Res>
    implements $ChapterQuizDtoCopyWith<$Res> {
  _$ChapterQuizDtoCopyWithImpl(this._self, this._then);

  final ChapterQuizDto _self;
  final $Res Function(ChapterQuizDto) _then;

/// Create a copy of ChapterQuizDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapter = null,Object? title = null,Object? questions = null,}) {
  return _then(_self.copyWith(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterQuizDto].
extension ChapterQuizDtoPatterns on ChapterQuizDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterQuizDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterQuizDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterQuizDto value)  $default,){
final _that = this;
switch (_that) {
case _ChapterQuizDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterQuizDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterQuizDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int chapter,  String title,  List<QuizQuestionDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterQuizDto() when $default != null:
return $default(_that.chapter,_that.title,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int chapter,  String title,  List<QuizQuestionDto> questions)  $default,) {final _that = this;
switch (_that) {
case _ChapterQuizDto():
return $default(_that.chapter,_that.title,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int chapter,  String title,  List<QuizQuestionDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _ChapterQuizDto() when $default != null:
return $default(_that.chapter,_that.title,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterQuizDto extends ChapterQuizDto {
  const _ChapterQuizDto({required this.chapter, required this.title, required final  List<QuizQuestionDto> questions}): _questions = questions,super._();
  factory _ChapterQuizDto.fromJson(Map<String, dynamic> json) => _$ChapterQuizDtoFromJson(json);

@override final  int chapter;
@override final  String title;
 final  List<QuizQuestionDto> _questions;
@override List<QuizQuestionDto> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of ChapterQuizDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterQuizDtoCopyWith<_ChapterQuizDto> get copyWith => __$ChapterQuizDtoCopyWithImpl<_ChapterQuizDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterQuizDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterQuizDto&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapter,title,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'ChapterQuizDto(chapter: $chapter, title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$ChapterQuizDtoCopyWith<$Res> implements $ChapterQuizDtoCopyWith<$Res> {
  factory _$ChapterQuizDtoCopyWith(_ChapterQuizDto value, $Res Function(_ChapterQuizDto) _then) = __$ChapterQuizDtoCopyWithImpl;
@override @useResult
$Res call({
 int chapter, String title, List<QuizQuestionDto> questions
});




}
/// @nodoc
class __$ChapterQuizDtoCopyWithImpl<$Res>
    implements _$ChapterQuizDtoCopyWith<$Res> {
  __$ChapterQuizDtoCopyWithImpl(this._self, this._then);

  final _ChapterQuizDto _self;
  final $Res Function(_ChapterQuizDto) _then;

/// Create a copy of ChapterQuizDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapter = null,Object? title = null,Object? questions = null,}) {
  return _then(_ChapterQuizDto(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestionDto>,
  ));
}


}

// dart format on
