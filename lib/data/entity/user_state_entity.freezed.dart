// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStateEntity {

 PersonalInfo get personalInfo; Set<int> get doneChapters; int? get lastChapter; List<String> get recentChatTopics;@TtsSettingsConverter() TtsSettings? get ttsSetting; dynamic get allowedToUseApp;
/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateEntityCopyWith<UserStateEntity> get copyWith => _$UserStateEntityCopyWithImpl<UserStateEntity>(this as UserStateEntity, _$identity);

  /// Serializes this UserStateEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStateEntity&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other.doneChapters, doneChapters)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&const DeepCollectionEquality().equals(other.recentChatTopics, recentChatTopics)&&(identical(other.ttsSetting, ttsSetting) || other.ttsSetting == ttsSetting)&&const DeepCollectionEquality().equals(other.allowedToUseApp, allowedToUseApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,personalInfo,const DeepCollectionEquality().hash(doneChapters),lastChapter,const DeepCollectionEquality().hash(recentChatTopics),ttsSetting,const DeepCollectionEquality().hash(allowedToUseApp));

@override
String toString() {
  return 'UserStateEntity(personalInfo: $personalInfo, doneChapters: $doneChapters, lastChapter: $lastChapter, recentChatTopics: $recentChatTopics, ttsSetting: $ttsSetting, allowedToUseApp: $allowedToUseApp)';
}


}

/// @nodoc
abstract mixin class $UserStateEntityCopyWith<$Res>  {
  factory $UserStateEntityCopyWith(UserStateEntity value, $Res Function(UserStateEntity) _then) = _$UserStateEntityCopyWithImpl;
@useResult
$Res call({
 PersonalInfo personalInfo, Set<int> doneChapters, int? lastChapter, List<String> recentChatTopics,@TtsSettingsConverter() TtsSettings? ttsSetting, dynamic allowedToUseApp
});


$PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class _$UserStateEntityCopyWithImpl<$Res>
    implements $UserStateEntityCopyWith<$Res> {
  _$UserStateEntityCopyWithImpl(this._self, this._then);

  final UserStateEntity _self;
  final $Res Function(UserStateEntity) _then;

/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? personalInfo = null,Object? doneChapters = null,Object? lastChapter = freezed,Object? recentChatTopics = null,Object? ttsSetting = freezed,Object? allowedToUseApp = freezed,}) {
  return _then(_self.copyWith(
personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,doneChapters: null == doneChapters ? _self.doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as int?,recentChatTopics: null == recentChatTopics ? _self.recentChatTopics : recentChatTopics // ignore: cast_nullable_to_non_nullable
as List<String>,ttsSetting: freezed == ttsSetting ? _self.ttsSetting : ttsSetting // ignore: cast_nullable_to_non_nullable
as TtsSettings?,allowedToUseApp: freezed == allowedToUseApp ? _self.allowedToUseApp : allowedToUseApp // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserStateEntity].
extension UserStateEntityPatterns on UserStateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStateEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserStateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserStateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics, @TtsSettingsConverter()  TtsSettings? ttsSetting,  dynamic allowedToUseApp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStateEntity() when $default != null:
return $default(_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSetting,_that.allowedToUseApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics, @TtsSettingsConverter()  TtsSettings? ttsSetting,  dynamic allowedToUseApp)  $default,) {final _that = this;
switch (_that) {
case _UserStateEntity():
return $default(_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSetting,_that.allowedToUseApp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics, @TtsSettingsConverter()  TtsSettings? ttsSetting,  dynamic allowedToUseApp)?  $default,) {final _that = this;
switch (_that) {
case _UserStateEntity() when $default != null:
return $default(_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSetting,_that.allowedToUseApp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStateEntity extends UserStateEntity {
  const _UserStateEntity({required this.personalInfo, final  Set<int> doneChapters = const <int>{}, this.lastChapter, final  List<String> recentChatTopics = const <String>[], @TtsSettingsConverter() this.ttsSetting, this.allowedToUseApp = true}): _doneChapters = doneChapters,_recentChatTopics = recentChatTopics,super._();
  factory _UserStateEntity.fromJson(Map<String, dynamic> json) => _$UserStateEntityFromJson(json);

@override final  PersonalInfo personalInfo;
 final  Set<int> _doneChapters;
@override@JsonKey() Set<int> get doneChapters {
  if (_doneChapters is EqualUnmodifiableSetView) return _doneChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_doneChapters);
}

@override final  int? lastChapter;
 final  List<String> _recentChatTopics;
@override@JsonKey() List<String> get recentChatTopics {
  if (_recentChatTopics is EqualUnmodifiableListView) return _recentChatTopics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentChatTopics);
}

@override@TtsSettingsConverter() final  TtsSettings? ttsSetting;
@override@JsonKey() final  dynamic allowedToUseApp;

/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStateEntityCopyWith<_UserStateEntity> get copyWith => __$UserStateEntityCopyWithImpl<_UserStateEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStateEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStateEntity&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other._doneChapters, _doneChapters)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&const DeepCollectionEquality().equals(other._recentChatTopics, _recentChatTopics)&&(identical(other.ttsSetting, ttsSetting) || other.ttsSetting == ttsSetting)&&const DeepCollectionEquality().equals(other.allowedToUseApp, allowedToUseApp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,personalInfo,const DeepCollectionEquality().hash(_doneChapters),lastChapter,const DeepCollectionEquality().hash(_recentChatTopics),ttsSetting,const DeepCollectionEquality().hash(allowedToUseApp));

@override
String toString() {
  return 'UserStateEntity(personalInfo: $personalInfo, doneChapters: $doneChapters, lastChapter: $lastChapter, recentChatTopics: $recentChatTopics, ttsSetting: $ttsSetting, allowedToUseApp: $allowedToUseApp)';
}


}

/// @nodoc
abstract mixin class _$UserStateEntityCopyWith<$Res> implements $UserStateEntityCopyWith<$Res> {
  factory _$UserStateEntityCopyWith(_UserStateEntity value, $Res Function(_UserStateEntity) _then) = __$UserStateEntityCopyWithImpl;
@override @useResult
$Res call({
 PersonalInfo personalInfo, Set<int> doneChapters, int? lastChapter, List<String> recentChatTopics,@TtsSettingsConverter() TtsSettings? ttsSetting, dynamic allowedToUseApp
});


@override $PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class __$UserStateEntityCopyWithImpl<$Res>
    implements _$UserStateEntityCopyWith<$Res> {
  __$UserStateEntityCopyWithImpl(this._self, this._then);

  final _UserStateEntity _self;
  final $Res Function(_UserStateEntity) _then;

/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? personalInfo = null,Object? doneChapters = null,Object? lastChapter = freezed,Object? recentChatTopics = null,Object? ttsSetting = freezed,Object? allowedToUseApp = freezed,}) {
  return _then(_UserStateEntity(
personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,doneChapters: null == doneChapters ? _self._doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as int?,recentChatTopics: null == recentChatTopics ? _self._recentChatTopics : recentChatTopics // ignore: cast_nullable_to_non_nullable
as List<String>,ttsSetting: freezed == ttsSetting ? _self.ttsSetting : ttsSetting // ignore: cast_nullable_to_non_nullable
as TtsSettings?,allowedToUseApp: freezed == allowedToUseApp ? _self.allowedToUseApp : allowedToUseApp // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of UserStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}

// dart format on
