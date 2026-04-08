// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChapterReaderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterReaderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChapterReaderState()';
}


}

/// @nodoc
class $ChapterReaderStateCopyWith<$Res>  {
$ChapterReaderStateCopyWith(ChapterReaderState _, $Res Function(ChapterReaderState) __);
}


/// Adds pattern-matching-related methods to [ChapterReaderState].
extension ChapterReaderStatePatterns on ChapterReaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChapterReaderLoading value)?  loading,TResult Function( ChapterReaderLoaded value)?  loaded,TResult Function( ChapterReaderError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChapterReaderLoading() when loading != null:
return loading(_that);case ChapterReaderLoaded() when loaded != null:
return loaded(_that);case ChapterReaderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChapterReaderLoading value)  loading,required TResult Function( ChapterReaderLoaded value)  loaded,required TResult Function( ChapterReaderError value)  error,}){
final _that = this;
switch (_that) {
case ChapterReaderLoading():
return loading(_that);case ChapterReaderLoaded():
return loaded(_that);case ChapterReaderError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChapterReaderLoading value)?  loading,TResult? Function( ChapterReaderLoaded value)?  loaded,TResult? Function( ChapterReaderError value)?  error,}){
final _that = this;
switch (_that) {
case ChapterReaderLoading() when loading != null:
return loading(_that);case ChapterReaderLoaded() when loaded != null:
return loaded(_that);case ChapterReaderError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ChapterModel chapter,  ChapterContentModel? content,  double progress,  bool isFinished,  ChapterQuizResult? quizResult)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChapterReaderLoading() when loading != null:
return loading();case ChapterReaderLoaded() when loaded != null:
return loaded(_that.chapter,_that.content,_that.progress,_that.isFinished,_that.quizResult);case ChapterReaderError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ChapterModel chapter,  ChapterContentModel? content,  double progress,  bool isFinished,  ChapterQuizResult? quizResult)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ChapterReaderLoading():
return loading();case ChapterReaderLoaded():
return loaded(_that.chapter,_that.content,_that.progress,_that.isFinished,_that.quizResult);case ChapterReaderError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ChapterModel chapter,  ChapterContentModel? content,  double progress,  bool isFinished,  ChapterQuizResult? quizResult)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ChapterReaderLoading() when loading != null:
return loading();case ChapterReaderLoaded() when loaded != null:
return loaded(_that.chapter,_that.content,_that.progress,_that.isFinished,_that.quizResult);case ChapterReaderError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ChapterReaderLoading implements ChapterReaderState {
  const ChapterReaderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterReaderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChapterReaderState.loading()';
}


}




/// @nodoc


class ChapterReaderLoaded implements ChapterReaderState {
  const ChapterReaderLoaded({required this.chapter, required this.content, required this.progress, required this.isFinished, this.quizResult});
  

 final  ChapterModel chapter;
 final  ChapterContentModel? content;
 final  double progress;
 final  bool isFinished;
 final  ChapterQuizResult? quizResult;

/// Create a copy of ChapterReaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterReaderLoadedCopyWith<ChapterReaderLoaded> get copyWith => _$ChapterReaderLoadedCopyWithImpl<ChapterReaderLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterReaderLoaded&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.content, content) || other.content == content)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.quizResult, quizResult) || other.quizResult == quizResult));
}


@override
int get hashCode => Object.hash(runtimeType,chapter,content,progress,isFinished,quizResult);

@override
String toString() {
  return 'ChapterReaderState.loaded(chapter: $chapter, content: $content, progress: $progress, isFinished: $isFinished, quizResult: $quizResult)';
}


}

/// @nodoc
abstract mixin class $ChapterReaderLoadedCopyWith<$Res> implements $ChapterReaderStateCopyWith<$Res> {
  factory $ChapterReaderLoadedCopyWith(ChapterReaderLoaded value, $Res Function(ChapterReaderLoaded) _then) = _$ChapterReaderLoadedCopyWithImpl;
@useResult
$Res call({
 ChapterModel chapter, ChapterContentModel? content, double progress, bool isFinished, ChapterQuizResult? quizResult
});




}
/// @nodoc
class _$ChapterReaderLoadedCopyWithImpl<$Res>
    implements $ChapterReaderLoadedCopyWith<$Res> {
  _$ChapterReaderLoadedCopyWithImpl(this._self, this._then);

  final ChapterReaderLoaded _self;
  final $Res Function(ChapterReaderLoaded) _then;

/// Create a copy of ChapterReaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chapter = null,Object? content = freezed,Object? progress = null,Object? isFinished = null,Object? quizResult = freezed,}) {
  return _then(ChapterReaderLoaded(
chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as ChapterModel,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ChapterContentModel?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,quizResult: freezed == quizResult ? _self.quizResult : quizResult // ignore: cast_nullable_to_non_nullable
as ChapterQuizResult?,
  ));
}


}

/// @nodoc


class ChapterReaderError implements ChapterReaderState {
  const ChapterReaderError({required this.message});
  

 final  String message;

/// Create a copy of ChapterReaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterReaderErrorCopyWith<ChapterReaderError> get copyWith => _$ChapterReaderErrorCopyWithImpl<ChapterReaderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterReaderError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChapterReaderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChapterReaderErrorCopyWith<$Res> implements $ChapterReaderStateCopyWith<$Res> {
  factory $ChapterReaderErrorCopyWith(ChapterReaderError value, $Res Function(ChapterReaderError) _then) = _$ChapterReaderErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChapterReaderErrorCopyWithImpl<$Res>
    implements $ChapterReaderErrorCopyWith<$Res> {
  _$ChapterReaderErrorCopyWithImpl(this._self, this._then);

  final ChapterReaderError _self;
  final $Res Function(ChapterReaderError) _then;

/// Create a copy of ChapterReaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChapterReaderError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
