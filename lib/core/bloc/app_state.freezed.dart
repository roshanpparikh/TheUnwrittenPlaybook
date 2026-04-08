// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {

 UserStateModel get userState; bool get isLoading; bool get isOnboarded; PlaybookPart? get currentChapterPart; NavigationAction get navigationAction; AppBottomNavigationPage get lastNavigatedBottomNavigationPage; bool get initialized; bool get onboardingVideoViewed; List<ChapterQuizResult> get chapterQuizResults;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.userState, userState) || other.userState == userState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.currentChapterPart, currentChapterPart) || other.currentChapterPart == currentChapterPart)&&(identical(other.navigationAction, navigationAction) || other.navigationAction == navigationAction)&&(identical(other.lastNavigatedBottomNavigationPage, lastNavigatedBottomNavigationPage) || other.lastNavigatedBottomNavigationPage == lastNavigatedBottomNavigationPage)&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.onboardingVideoViewed, onboardingVideoViewed) || other.onboardingVideoViewed == onboardingVideoViewed)&&const DeepCollectionEquality().equals(other.chapterQuizResults, chapterQuizResults));
}


@override
int get hashCode => Object.hash(runtimeType,userState,isLoading,isOnboarded,currentChapterPart,navigationAction,lastNavigatedBottomNavigationPage,initialized,onboardingVideoViewed,const DeepCollectionEquality().hash(chapterQuizResults));

@override
String toString() {
  return 'AppState(userState: $userState, isLoading: $isLoading, isOnboarded: $isOnboarded, currentChapterPart: $currentChapterPart, navigationAction: $navigationAction, lastNavigatedBottomNavigationPage: $lastNavigatedBottomNavigationPage, initialized: $initialized, onboardingVideoViewed: $onboardingVideoViewed, chapterQuizResults: $chapterQuizResults)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 UserStateModel userState, bool isLoading, bool isOnboarded, PlaybookPart? currentChapterPart, NavigationAction navigationAction, AppBottomNavigationPage lastNavigatedBottomNavigationPage, bool initialized, bool onboardingVideoViewed, List<ChapterQuizResult> chapterQuizResults
});


$UserStateModelCopyWith<$Res> get userState;$NavigationActionCopyWith<$Res> get navigationAction;

}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userState = null,Object? isLoading = null,Object? isOnboarded = null,Object? currentChapterPart = freezed,Object? navigationAction = null,Object? lastNavigatedBottomNavigationPage = null,Object? initialized = null,Object? onboardingVideoViewed = null,Object? chapterQuizResults = null,}) {
  return _then(_self.copyWith(
userState: null == userState ? _self.userState : userState // ignore: cast_nullable_to_non_nullable
as UserStateModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,currentChapterPart: freezed == currentChapterPart ? _self.currentChapterPart : currentChapterPart // ignore: cast_nullable_to_non_nullable
as PlaybookPart?,navigationAction: null == navigationAction ? _self.navigationAction : navigationAction // ignore: cast_nullable_to_non_nullable
as NavigationAction,lastNavigatedBottomNavigationPage: null == lastNavigatedBottomNavigationPage ? _self.lastNavigatedBottomNavigationPage : lastNavigatedBottomNavigationPage // ignore: cast_nullable_to_non_nullable
as AppBottomNavigationPage,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,onboardingVideoViewed: null == onboardingVideoViewed ? _self.onboardingVideoViewed : onboardingVideoViewed // ignore: cast_nullable_to_non_nullable
as bool,chapterQuizResults: null == chapterQuizResults ? _self.chapterQuizResults : chapterQuizResults // ignore: cast_nullable_to_non_nullable
as List<ChapterQuizResult>,
  ));
}
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStateModelCopyWith<$Res> get userState {
  
  return $UserStateModelCopyWith<$Res>(_self.userState, (value) {
    return _then(_self.copyWith(userState: value));
  });
}/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationActionCopyWith<$Res> get navigationAction {
  
  return $NavigationActionCopyWith<$Res>(_self.navigationAction, (value) {
    return _then(_self.copyWith(navigationAction: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserStateModel userState,  bool isLoading,  bool isOnboarded,  PlaybookPart? currentChapterPart,  NavigationAction navigationAction,  AppBottomNavigationPage lastNavigatedBottomNavigationPage,  bool initialized,  bool onboardingVideoViewed,  List<ChapterQuizResult> chapterQuizResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.userState,_that.isLoading,_that.isOnboarded,_that.currentChapterPart,_that.navigationAction,_that.lastNavigatedBottomNavigationPage,_that.initialized,_that.onboardingVideoViewed,_that.chapterQuizResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserStateModel userState,  bool isLoading,  bool isOnboarded,  PlaybookPart? currentChapterPart,  NavigationAction navigationAction,  AppBottomNavigationPage lastNavigatedBottomNavigationPage,  bool initialized,  bool onboardingVideoViewed,  List<ChapterQuizResult> chapterQuizResults)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.userState,_that.isLoading,_that.isOnboarded,_that.currentChapterPart,_that.navigationAction,_that.lastNavigatedBottomNavigationPage,_that.initialized,_that.onboardingVideoViewed,_that.chapterQuizResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserStateModel userState,  bool isLoading,  bool isOnboarded,  PlaybookPart? currentChapterPart,  NavigationAction navigationAction,  AppBottomNavigationPage lastNavigatedBottomNavigationPage,  bool initialized,  bool onboardingVideoViewed,  List<ChapterQuizResult> chapterQuizResults)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.userState,_that.isLoading,_that.isOnboarded,_that.currentChapterPart,_that.navigationAction,_that.lastNavigatedBottomNavigationPage,_that.initialized,_that.onboardingVideoViewed,_that.chapterQuizResults);case _:
  return null;

}
}

}

/// @nodoc


class _AppState implements AppState {
  const _AppState({required this.userState, this.isLoading = false, this.isOnboarded = false, this.currentChapterPart, required this.navigationAction, this.lastNavigatedBottomNavigationPage = AppBottomNavigationPage.playbook, this.initialized = false, this.onboardingVideoViewed = false, final  List<ChapterQuizResult> chapterQuizResults = const []}): _chapterQuizResults = chapterQuizResults;
  

@override final  UserStateModel userState;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isOnboarded;
@override final  PlaybookPart? currentChapterPart;
@override final  NavigationAction navigationAction;
@override@JsonKey() final  AppBottomNavigationPage lastNavigatedBottomNavigationPage;
@override@JsonKey() final  bool initialized;
@override@JsonKey() final  bool onboardingVideoViewed;
 final  List<ChapterQuizResult> _chapterQuizResults;
@override@JsonKey() List<ChapterQuizResult> get chapterQuizResults {
  if (_chapterQuizResults is EqualUnmodifiableListView) return _chapterQuizResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapterQuizResults);
}


/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.userState, userState) || other.userState == userState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.currentChapterPart, currentChapterPart) || other.currentChapterPart == currentChapterPart)&&(identical(other.navigationAction, navigationAction) || other.navigationAction == navigationAction)&&(identical(other.lastNavigatedBottomNavigationPage, lastNavigatedBottomNavigationPage) || other.lastNavigatedBottomNavigationPage == lastNavigatedBottomNavigationPage)&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.onboardingVideoViewed, onboardingVideoViewed) || other.onboardingVideoViewed == onboardingVideoViewed)&&const DeepCollectionEquality().equals(other._chapterQuizResults, _chapterQuizResults));
}


@override
int get hashCode => Object.hash(runtimeType,userState,isLoading,isOnboarded,currentChapterPart,navigationAction,lastNavigatedBottomNavigationPage,initialized,onboardingVideoViewed,const DeepCollectionEquality().hash(_chapterQuizResults));

@override
String toString() {
  return 'AppState(userState: $userState, isLoading: $isLoading, isOnboarded: $isOnboarded, currentChapterPart: $currentChapterPart, navigationAction: $navigationAction, lastNavigatedBottomNavigationPage: $lastNavigatedBottomNavigationPage, initialized: $initialized, onboardingVideoViewed: $onboardingVideoViewed, chapterQuizResults: $chapterQuizResults)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 UserStateModel userState, bool isLoading, bool isOnboarded, PlaybookPart? currentChapterPart, NavigationAction navigationAction, AppBottomNavigationPage lastNavigatedBottomNavigationPage, bool initialized, bool onboardingVideoViewed, List<ChapterQuizResult> chapterQuizResults
});


@override $UserStateModelCopyWith<$Res> get userState;@override $NavigationActionCopyWith<$Res> get navigationAction;

}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userState = null,Object? isLoading = null,Object? isOnboarded = null,Object? currentChapterPart = freezed,Object? navigationAction = null,Object? lastNavigatedBottomNavigationPage = null,Object? initialized = null,Object? onboardingVideoViewed = null,Object? chapterQuizResults = null,}) {
  return _then(_AppState(
userState: null == userState ? _self.userState : userState // ignore: cast_nullable_to_non_nullable
as UserStateModel,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,currentChapterPart: freezed == currentChapterPart ? _self.currentChapterPart : currentChapterPart // ignore: cast_nullable_to_non_nullable
as PlaybookPart?,navigationAction: null == navigationAction ? _self.navigationAction : navigationAction // ignore: cast_nullable_to_non_nullable
as NavigationAction,lastNavigatedBottomNavigationPage: null == lastNavigatedBottomNavigationPage ? _self.lastNavigatedBottomNavigationPage : lastNavigatedBottomNavigationPage // ignore: cast_nullable_to_non_nullable
as AppBottomNavigationPage,initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,onboardingVideoViewed: null == onboardingVideoViewed ? _self.onboardingVideoViewed : onboardingVideoViewed // ignore: cast_nullable_to_non_nullable
as bool,chapterQuizResults: null == chapterQuizResults ? _self._chapterQuizResults : chapterQuizResults // ignore: cast_nullable_to_non_nullable
as List<ChapterQuizResult>,
  ));
}

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStateModelCopyWith<$Res> get userState {
  
  return $UserStateModelCopyWith<$Res>(_self.userState, (value) {
    return _then(_self.copyWith(userState: value));
  });
}/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationActionCopyWith<$Res> get navigationAction {
  
  return $NavigationActionCopyWith<$Res>(_self.navigationAction, (value) {
    return _then(_self.copyWith(navigationAction: value));
  });
}
}

// dart format on
