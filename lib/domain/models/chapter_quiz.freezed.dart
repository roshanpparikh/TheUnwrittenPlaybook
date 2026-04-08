// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChapterQuiz {

 int get chapter; String get title; List<QuizQuestion> get questions;
/// Create a copy of ChapterQuiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterQuizCopyWith<ChapterQuiz> get copyWith => _$ChapterQuizCopyWithImpl<ChapterQuiz>(this as ChapterQuiz, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterQuiz&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.questions, questions));
}


@override
int get hashCode => Object.hash(runtimeType,chapter,title,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'ChapterQuiz(chapter: $chapter, title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $ChapterQuizCopyWith<$Res>  {
  factory $ChapterQuizCopyWith(ChapterQuiz value, $Res Function(ChapterQuiz) _then) = _$ChapterQuizCopyWithImpl;
@useResult
$Res call({
 int chapter, String title, List<QuizQuestion> questions
});




}
/// @nodoc
class _$ChapterQuizCopyWithImpl<$Res>
    implements $ChapterQuizCopyWith<$Res> {
  _$ChapterQuizCopyWithImpl(this._self, this._then);

  final ChapterQuiz _self;
  final $Res Function(ChapterQuiz) _then;

/// Create a copy of ChapterQuiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapter = null,Object? title = null,Object? questions = null,}) {
  return _then(_self.copyWith(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterQuiz].
extension ChapterQuizPatterns on ChapterQuiz {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterQuiz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterQuiz() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterQuiz value)  $default,){
final _that = this;
switch (_that) {
case _ChapterQuiz():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterQuiz value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterQuiz() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int chapter,  String title,  List<QuizQuestion> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterQuiz() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int chapter,  String title,  List<QuizQuestion> questions)  $default,) {final _that = this;
switch (_that) {
case _ChapterQuiz():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int chapter,  String title,  List<QuizQuestion> questions)?  $default,) {final _that = this;
switch (_that) {
case _ChapterQuiz() when $default != null:
return $default(_that.chapter,_that.title,_that.questions);case _:
  return null;

}
}

}

/// @nodoc


class _ChapterQuiz implements ChapterQuiz {
  const _ChapterQuiz({required this.chapter, required this.title, required final  List<QuizQuestion> questions}): _questions = questions;
  

@override final  int chapter;
@override final  String title;
 final  List<QuizQuestion> _questions;
@override List<QuizQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of ChapterQuiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterQuizCopyWith<_ChapterQuiz> get copyWith => __$ChapterQuizCopyWithImpl<_ChapterQuiz>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterQuiz&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,chapter,title,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'ChapterQuiz(chapter: $chapter, title: $title, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$ChapterQuizCopyWith<$Res> implements $ChapterQuizCopyWith<$Res> {
  factory _$ChapterQuizCopyWith(_ChapterQuiz value, $Res Function(_ChapterQuiz) _then) = __$ChapterQuizCopyWithImpl;
@override @useResult
$Res call({
 int chapter, String title, List<QuizQuestion> questions
});




}
/// @nodoc
class __$ChapterQuizCopyWithImpl<$Res>
    implements _$ChapterQuizCopyWith<$Res> {
  __$ChapterQuizCopyWithImpl(this._self, this._then);

  final _ChapterQuiz _self;
  final $Res Function(_ChapterQuiz) _then;

/// Create a copy of ChapterQuiz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapter = null,Object? title = null,Object? questions = null,}) {
  return _then(_ChapterQuiz(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuizQuestion>,
  ));
}


}

// dart format on
