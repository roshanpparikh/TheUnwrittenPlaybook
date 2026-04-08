// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserStateModel {

 String? get firebaseId; PersonalInfo get personalInfo; Set<int> get doneChapters; int? get lastChapter; List<String> get recentChatTopics; TtsSettings? get ttsSettings;
/// Create a copy of UserStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStateModelCopyWith<UserStateModel> get copyWith => _$UserStateModelCopyWithImpl<UserStateModel>(this as UserStateModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStateModel&&(identical(other.firebaseId, firebaseId) || other.firebaseId == firebaseId)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other.doneChapters, doneChapters)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&const DeepCollectionEquality().equals(other.recentChatTopics, recentChatTopics)&&(identical(other.ttsSettings, ttsSettings) || other.ttsSettings == ttsSettings));
}


@override
int get hashCode => Object.hash(runtimeType,firebaseId,personalInfo,const DeepCollectionEquality().hash(doneChapters),lastChapter,const DeepCollectionEquality().hash(recentChatTopics),ttsSettings);

@override
String toString() {
  return 'UserStateModel(firebaseId: $firebaseId, personalInfo: $personalInfo, doneChapters: $doneChapters, lastChapter: $lastChapter, recentChatTopics: $recentChatTopics, ttsSettings: $ttsSettings)';
}


}

/// @nodoc
abstract mixin class $UserStateModelCopyWith<$Res>  {
  factory $UserStateModelCopyWith(UserStateModel value, $Res Function(UserStateModel) _then) = _$UserStateModelCopyWithImpl;
@useResult
$Res call({
 String? firebaseId, PersonalInfo personalInfo, Set<int> doneChapters, int? lastChapter, List<String> recentChatTopics, TtsSettings? ttsSettings
});


$PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class _$UserStateModelCopyWithImpl<$Res>
    implements $UserStateModelCopyWith<$Res> {
  _$UserStateModelCopyWithImpl(this._self, this._then);

  final UserStateModel _self;
  final $Res Function(UserStateModel) _then;

/// Create a copy of UserStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firebaseId = freezed,Object? personalInfo = null,Object? doneChapters = null,Object? lastChapter = freezed,Object? recentChatTopics = null,Object? ttsSettings = freezed,}) {
  return _then(_self.copyWith(
firebaseId: freezed == firebaseId ? _self.firebaseId : firebaseId // ignore: cast_nullable_to_non_nullable
as String?,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,doneChapters: null == doneChapters ? _self.doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as int?,recentChatTopics: null == recentChatTopics ? _self.recentChatTopics : recentChatTopics // ignore: cast_nullable_to_non_nullable
as List<String>,ttsSettings: freezed == ttsSettings ? _self.ttsSettings : ttsSettings // ignore: cast_nullable_to_non_nullable
as TtsSettings?,
  ));
}
/// Create a copy of UserStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserStateModel].
extension UserStateModelPatterns on UserStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStateModel value)  $default,){
final _that = this;
switch (_that) {
case _UserStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firebaseId,  PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics,  TtsSettings? ttsSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStateModel() when $default != null:
return $default(_that.firebaseId,_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firebaseId,  PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics,  TtsSettings? ttsSettings)  $default,) {final _that = this;
switch (_that) {
case _UserStateModel():
return $default(_that.firebaseId,_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSettings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firebaseId,  PersonalInfo personalInfo,  Set<int> doneChapters,  int? lastChapter,  List<String> recentChatTopics,  TtsSettings? ttsSettings)?  $default,) {final _that = this;
switch (_that) {
case _UserStateModel() when $default != null:
return $default(_that.firebaseId,_that.personalInfo,_that.doneChapters,_that.lastChapter,_that.recentChatTopics,_that.ttsSettings);case _:
  return null;

}
}

}

/// @nodoc


class _UserStateModel extends UserStateModel {
  const _UserStateModel({required this.firebaseId, required this.personalInfo, final  Set<int> doneChapters = const <int>{}, this.lastChapter, final  List<String> recentChatTopics = const <String>[], this.ttsSettings}): _doneChapters = doneChapters,_recentChatTopics = recentChatTopics,super._();
  

@override final  String? firebaseId;
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

@override final  TtsSettings? ttsSettings;

/// Create a copy of UserStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStateModelCopyWith<_UserStateModel> get copyWith => __$UserStateModelCopyWithImpl<_UserStateModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStateModel&&(identical(other.firebaseId, firebaseId) || other.firebaseId == firebaseId)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other._doneChapters, _doneChapters)&&(identical(other.lastChapter, lastChapter) || other.lastChapter == lastChapter)&&const DeepCollectionEquality().equals(other._recentChatTopics, _recentChatTopics)&&(identical(other.ttsSettings, ttsSettings) || other.ttsSettings == ttsSettings));
}


@override
int get hashCode => Object.hash(runtimeType,firebaseId,personalInfo,const DeepCollectionEquality().hash(_doneChapters),lastChapter,const DeepCollectionEquality().hash(_recentChatTopics),ttsSettings);

@override
String toString() {
  return 'UserStateModel(firebaseId: $firebaseId, personalInfo: $personalInfo, doneChapters: $doneChapters, lastChapter: $lastChapter, recentChatTopics: $recentChatTopics, ttsSettings: $ttsSettings)';
}


}

/// @nodoc
abstract mixin class _$UserStateModelCopyWith<$Res> implements $UserStateModelCopyWith<$Res> {
  factory _$UserStateModelCopyWith(_UserStateModel value, $Res Function(_UserStateModel) _then) = __$UserStateModelCopyWithImpl;
@override @useResult
$Res call({
 String? firebaseId, PersonalInfo personalInfo, Set<int> doneChapters, int? lastChapter, List<String> recentChatTopics, TtsSettings? ttsSettings
});


@override $PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class __$UserStateModelCopyWithImpl<$Res>
    implements _$UserStateModelCopyWith<$Res> {
  __$UserStateModelCopyWithImpl(this._self, this._then);

  final _UserStateModel _self;
  final $Res Function(_UserStateModel) _then;

/// Create a copy of UserStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firebaseId = freezed,Object? personalInfo = null,Object? doneChapters = null,Object? lastChapter = freezed,Object? recentChatTopics = null,Object? ttsSettings = freezed,}) {
  return _then(_UserStateModel(
firebaseId: freezed == firebaseId ? _self.firebaseId : firebaseId // ignore: cast_nullable_to_non_nullable
as String?,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,doneChapters: null == doneChapters ? _self._doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,lastChapter: freezed == lastChapter ? _self.lastChapter : lastChapter // ignore: cast_nullable_to_non_nullable
as int?,recentChatTopics: null == recentChatTopics ? _self._recentChatTopics : recentChatTopics // ignore: cast_nullable_to_non_nullable
as List<String>,ttsSettings: freezed == ttsSettings ? _self.ttsSettings : ttsSettings // ignore: cast_nullable_to_non_nullable
as TtsSettings?,
  ));
}

/// Create a copy of UserStateModel
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
