// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationCubitState {

 bool get enabled; int get hour; int get minute; bool get isLoading;/// True when the user toggled notifications on but the OS denied permission.
 bool get permissionDenied;
/// Create a copy of NotificationCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCubitStateCopyWith<NotificationCubitState> get copyWith => _$NotificationCubitStateCopyWithImpl<NotificationCubitState>(this as NotificationCubitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCubitState&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,hour,minute,isLoading,permissionDenied);

@override
String toString() {
  return 'NotificationCubitState(enabled: $enabled, hour: $hour, minute: $minute, isLoading: $isLoading, permissionDenied: $permissionDenied)';
}


}

/// @nodoc
abstract mixin class $NotificationCubitStateCopyWith<$Res>  {
  factory $NotificationCubitStateCopyWith(NotificationCubitState value, $Res Function(NotificationCubitState) _then) = _$NotificationCubitStateCopyWithImpl;
@useResult
$Res call({
 bool enabled, int hour, int minute, bool isLoading, bool permissionDenied
});




}
/// @nodoc
class _$NotificationCubitStateCopyWithImpl<$Res>
    implements $NotificationCubitStateCopyWith<$Res> {
  _$NotificationCubitStateCopyWithImpl(this._self, this._then);

  final NotificationCubitState _self;
  final $Res Function(NotificationCubitState) _then;

/// Create a copy of NotificationCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? hour = null,Object? minute = null,Object? isLoading = null,Object? permissionDenied = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationCubitState].
extension NotificationCubitStatePatterns on NotificationCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationCubitState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationCubitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  int hour,  int minute,  bool isLoading,  bool permissionDenied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationCubitState() when $default != null:
return $default(_that.enabled,_that.hour,_that.minute,_that.isLoading,_that.permissionDenied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  int hour,  int minute,  bool isLoading,  bool permissionDenied)  $default,) {final _that = this;
switch (_that) {
case _NotificationCubitState():
return $default(_that.enabled,_that.hour,_that.minute,_that.isLoading,_that.permissionDenied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  int hour,  int minute,  bool isLoading,  bool permissionDenied)?  $default,) {final _that = this;
switch (_that) {
case _NotificationCubitState() when $default != null:
return $default(_that.enabled,_that.hour,_that.minute,_that.isLoading,_that.permissionDenied);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationCubitState implements NotificationCubitState {
  const _NotificationCubitState({this.enabled = false, this.hour = 9, this.minute = 0, this.isLoading = false, this.permissionDenied = false});
  

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  int hour;
@override@JsonKey() final  int minute;
@override@JsonKey() final  bool isLoading;
/// True when the user toggled notifications on but the OS denied permission.
@override@JsonKey() final  bool permissionDenied;

/// Create a copy of NotificationCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCubitStateCopyWith<_NotificationCubitState> get copyWith => __$NotificationCubitStateCopyWithImpl<_NotificationCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationCubitState&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.permissionDenied, permissionDenied) || other.permissionDenied == permissionDenied));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,hour,minute,isLoading,permissionDenied);

@override
String toString() {
  return 'NotificationCubitState(enabled: $enabled, hour: $hour, minute: $minute, isLoading: $isLoading, permissionDenied: $permissionDenied)';
}


}

/// @nodoc
abstract mixin class _$NotificationCubitStateCopyWith<$Res> implements $NotificationCubitStateCopyWith<$Res> {
  factory _$NotificationCubitStateCopyWith(_NotificationCubitState value, $Res Function(_NotificationCubitState) _then) = __$NotificationCubitStateCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, int hour, int minute, bool isLoading, bool permissionDenied
});




}
/// @nodoc
class __$NotificationCubitStateCopyWithImpl<$Res>
    implements _$NotificationCubitStateCopyWith<$Res> {
  __$NotificationCubitStateCopyWithImpl(this._self, this._then);

  final _NotificationCubitState _self;
  final $Res Function(_NotificationCubitState) _then;

/// Create a copy of NotificationCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? hour = null,Object? minute = null,Object? isLoading = null,Object? permissionDenied = null,}) {
  return _then(_NotificationCubitState(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,hour: null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,minute: null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,permissionDenied: null == permissionDenied ? _self.permissionDenied : permissionDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
