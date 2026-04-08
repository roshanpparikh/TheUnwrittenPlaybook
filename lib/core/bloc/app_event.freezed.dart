// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent()';
}


}

/// @nodoc
class $AppEventCopyWith<$Res>  {
$AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}


/// Adds pattern-matching-related methods to [AppEvent].
extension AppEventPatterns on AppEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppEventInitialize value)?  initialize,TResult Function( AppStartOnboarding value)?  startOnboarding,TResult Function( AppCompleteOnboarding value)?  completeOnboarding,TResult Function( AppEventResetNavigationAction value)?  resetNavigationAction,TResult Function( AppEventSetNavigationAction value)?  setNavigationAction,TResult Function( AppEventCloseOnboardingVideo value)?  closeOnboardingVideo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppEventInitialize() when initialize != null:
return initialize(_that);case AppStartOnboarding() when startOnboarding != null:
return startOnboarding(_that);case AppCompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case AppEventResetNavigationAction() when resetNavigationAction != null:
return resetNavigationAction(_that);case AppEventSetNavigationAction() when setNavigationAction != null:
return setNavigationAction(_that);case AppEventCloseOnboardingVideo() when closeOnboardingVideo != null:
return closeOnboardingVideo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppEventInitialize value)  initialize,required TResult Function( AppStartOnboarding value)  startOnboarding,required TResult Function( AppCompleteOnboarding value)  completeOnboarding,required TResult Function( AppEventResetNavigationAction value)  resetNavigationAction,required TResult Function( AppEventSetNavigationAction value)  setNavigationAction,required TResult Function( AppEventCloseOnboardingVideo value)  closeOnboardingVideo,}){
final _that = this;
switch (_that) {
case AppEventInitialize():
return initialize(_that);case AppStartOnboarding():
return startOnboarding(_that);case AppCompleteOnboarding():
return completeOnboarding(_that);case AppEventResetNavigationAction():
return resetNavigationAction(_that);case AppEventSetNavigationAction():
return setNavigationAction(_that);case AppEventCloseOnboardingVideo():
return closeOnboardingVideo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppEventInitialize value)?  initialize,TResult? Function( AppStartOnboarding value)?  startOnboarding,TResult? Function( AppCompleteOnboarding value)?  completeOnboarding,TResult? Function( AppEventResetNavigationAction value)?  resetNavigationAction,TResult? Function( AppEventSetNavigationAction value)?  setNavigationAction,TResult? Function( AppEventCloseOnboardingVideo value)?  closeOnboardingVideo,}){
final _that = this;
switch (_that) {
case AppEventInitialize() when initialize != null:
return initialize(_that);case AppStartOnboarding() when startOnboarding != null:
return startOnboarding(_that);case AppCompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case AppEventResetNavigationAction() when resetNavigationAction != null:
return resetNavigationAction(_that);case AppEventSetNavigationAction() when setNavigationAction != null:
return setNavigationAction(_that);case AppEventCloseOnboardingVideo() when closeOnboardingVideo != null:
return closeOnboardingVideo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialize,TResult Function()?  startOnboarding,TResult Function( PersonalInfo answers)?  completeOnboarding,TResult Function()?  resetNavigationAction,TResult Function( NavigationAction action)?  setNavigationAction,TResult Function( bool viewed)?  closeOnboardingVideo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppEventInitialize() when initialize != null:
return initialize();case AppStartOnboarding() when startOnboarding != null:
return startOnboarding();case AppCompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that.answers);case AppEventResetNavigationAction() when resetNavigationAction != null:
return resetNavigationAction();case AppEventSetNavigationAction() when setNavigationAction != null:
return setNavigationAction(_that.action);case AppEventCloseOnboardingVideo() when closeOnboardingVideo != null:
return closeOnboardingVideo(_that.viewed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialize,required TResult Function()  startOnboarding,required TResult Function( PersonalInfo answers)  completeOnboarding,required TResult Function()  resetNavigationAction,required TResult Function( NavigationAction action)  setNavigationAction,required TResult Function( bool viewed)  closeOnboardingVideo,}) {final _that = this;
switch (_that) {
case AppEventInitialize():
return initialize();case AppStartOnboarding():
return startOnboarding();case AppCompleteOnboarding():
return completeOnboarding(_that.answers);case AppEventResetNavigationAction():
return resetNavigationAction();case AppEventSetNavigationAction():
return setNavigationAction(_that.action);case AppEventCloseOnboardingVideo():
return closeOnboardingVideo(_that.viewed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialize,TResult? Function()?  startOnboarding,TResult? Function( PersonalInfo answers)?  completeOnboarding,TResult? Function()?  resetNavigationAction,TResult? Function( NavigationAction action)?  setNavigationAction,TResult? Function( bool viewed)?  closeOnboardingVideo,}) {final _that = this;
switch (_that) {
case AppEventInitialize() when initialize != null:
return initialize();case AppStartOnboarding() when startOnboarding != null:
return startOnboarding();case AppCompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that.answers);case AppEventResetNavigationAction() when resetNavigationAction != null:
return resetNavigationAction();case AppEventSetNavigationAction() when setNavigationAction != null:
return setNavigationAction(_that.action);case AppEventCloseOnboardingVideo() when closeOnboardingVideo != null:
return closeOnboardingVideo(_that.viewed);case _:
  return null;

}
}

}

/// @nodoc


class AppEventInitialize implements AppEvent {
  const AppEventInitialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEventInitialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.initialize()';
}


}




/// @nodoc


class AppStartOnboarding implements AppEvent {
  const AppStartOnboarding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStartOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.startOnboarding()';
}


}




/// @nodoc


class AppCompleteOnboarding implements AppEvent {
  const AppCompleteOnboarding(this.answers);
  

 final  PersonalInfo answers;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppCompleteOnboardingCopyWith<AppCompleteOnboarding> get copyWith => _$AppCompleteOnboardingCopyWithImpl<AppCompleteOnboarding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppCompleteOnboarding&&(identical(other.answers, answers) || other.answers == answers));
}


@override
int get hashCode => Object.hash(runtimeType,answers);

@override
String toString() {
  return 'AppEvent.completeOnboarding(answers: $answers)';
}


}

/// @nodoc
abstract mixin class $AppCompleteOnboardingCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppCompleteOnboardingCopyWith(AppCompleteOnboarding value, $Res Function(AppCompleteOnboarding) _then) = _$AppCompleteOnboardingCopyWithImpl;
@useResult
$Res call({
 PersonalInfo answers
});


$PersonalInfoCopyWith<$Res> get answers;

}
/// @nodoc
class _$AppCompleteOnboardingCopyWithImpl<$Res>
    implements $AppCompleteOnboardingCopyWith<$Res> {
  _$AppCompleteOnboardingCopyWithImpl(this._self, this._then);

  final AppCompleteOnboarding _self;
  final $Res Function(AppCompleteOnboarding) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? answers = null,}) {
  return _then(AppCompleteOnboarding(
null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as PersonalInfo,
  ));
}

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get answers {
  
  return $PersonalInfoCopyWith<$Res>(_self.answers, (value) {
    return _then(_self.copyWith(answers: value));
  });
}
}

/// @nodoc


class AppEventResetNavigationAction implements AppEvent {
  const AppEventResetNavigationAction();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEventResetNavigationAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppEvent.resetNavigationAction()';
}


}




/// @nodoc


class AppEventSetNavigationAction implements AppEvent {
  const AppEventSetNavigationAction(this.action);
  

 final  NavigationAction action;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppEventSetNavigationActionCopyWith<AppEventSetNavigationAction> get copyWith => _$AppEventSetNavigationActionCopyWithImpl<AppEventSetNavigationAction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEventSetNavigationAction&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,action);

@override
String toString() {
  return 'AppEvent.setNavigationAction(action: $action)';
}


}

/// @nodoc
abstract mixin class $AppEventSetNavigationActionCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppEventSetNavigationActionCopyWith(AppEventSetNavigationAction value, $Res Function(AppEventSetNavigationAction) _then) = _$AppEventSetNavigationActionCopyWithImpl;
@useResult
$Res call({
 NavigationAction action
});


$NavigationActionCopyWith<$Res> get action;

}
/// @nodoc
class _$AppEventSetNavigationActionCopyWithImpl<$Res>
    implements $AppEventSetNavigationActionCopyWith<$Res> {
  _$AppEventSetNavigationActionCopyWithImpl(this._self, this._then);

  final AppEventSetNavigationAction _self;
  final $Res Function(AppEventSetNavigationAction) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? action = null,}) {
  return _then(AppEventSetNavigationAction(
null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as NavigationAction,
  ));
}

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationActionCopyWith<$Res> get action {
  
  return $NavigationActionCopyWith<$Res>(_self.action, (value) {
    return _then(_self.copyWith(action: value));
  });
}
}

/// @nodoc


class AppEventCloseOnboardingVideo implements AppEvent {
  const AppEventCloseOnboardingVideo(this.viewed);
  

 final  bool viewed;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppEventCloseOnboardingVideoCopyWith<AppEventCloseOnboardingVideo> get copyWith => _$AppEventCloseOnboardingVideoCopyWithImpl<AppEventCloseOnboardingVideo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppEventCloseOnboardingVideo&&(identical(other.viewed, viewed) || other.viewed == viewed));
}


@override
int get hashCode => Object.hash(runtimeType,viewed);

@override
String toString() {
  return 'AppEvent.closeOnboardingVideo(viewed: $viewed)';
}


}

/// @nodoc
abstract mixin class $AppEventCloseOnboardingVideoCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  factory $AppEventCloseOnboardingVideoCopyWith(AppEventCloseOnboardingVideo value, $Res Function(AppEventCloseOnboardingVideo) _then) = _$AppEventCloseOnboardingVideoCopyWithImpl;
@useResult
$Res call({
 bool viewed
});




}
/// @nodoc
class _$AppEventCloseOnboardingVideoCopyWithImpl<$Res>
    implements $AppEventCloseOnboardingVideoCopyWith<$Res> {
  _$AppEventCloseOnboardingVideoCopyWithImpl(this._self, this._then);

  final AppEventCloseOnboardingVideo _self;
  final $Res Function(AppEventCloseOnboardingVideo) _then;

/// Create a copy of AppEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? viewed = null,}) {
  return _then(AppEventCloseOnboardingVideo(
null == viewed ? _self.viewed : viewed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
