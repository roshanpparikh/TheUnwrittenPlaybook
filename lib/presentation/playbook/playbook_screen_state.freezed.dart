// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playbook_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaybookScreenState {

 List<PlaybookPart> get parts; Map<String, List<PlaybookChapterItem>> get groupedChapters; TipModel? get dailyTip; String get userName; bool get isPersonalized; Set<int> get doneChapters; PersonalInfo get personalInfo;/// progress per chapter 0..1
 Map<int, double> get chapterProgress;
/// Create a copy of PlaybookScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybookScreenStateCopyWith<PlaybookScreenState> get copyWith => _$PlaybookScreenStateCopyWithImpl<PlaybookScreenState>(this as PlaybookScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybookScreenState&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.groupedChapters, groupedChapters)&&(identical(other.dailyTip, dailyTip) || other.dailyTip == dailyTip)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.isPersonalized, isPersonalized) || other.isPersonalized == isPersonalized)&&const DeepCollectionEquality().equals(other.doneChapters, doneChapters)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other.chapterProgress, chapterProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(groupedChapters),dailyTip,userName,isPersonalized,const DeepCollectionEquality().hash(doneChapters),personalInfo,const DeepCollectionEquality().hash(chapterProgress));

@override
String toString() {
  return 'PlaybookScreenState(parts: $parts, groupedChapters: $groupedChapters, dailyTip: $dailyTip, userName: $userName, isPersonalized: $isPersonalized, doneChapters: $doneChapters, personalInfo: $personalInfo, chapterProgress: $chapterProgress)';
}


}

/// @nodoc
abstract mixin class $PlaybookScreenStateCopyWith<$Res>  {
  factory $PlaybookScreenStateCopyWith(PlaybookScreenState value, $Res Function(PlaybookScreenState) _then) = _$PlaybookScreenStateCopyWithImpl;
@useResult
$Res call({
 List<PlaybookPart> parts, Map<String, List<PlaybookChapterItem>> groupedChapters, TipModel? dailyTip, String userName, bool isPersonalized, Set<int> doneChapters, PersonalInfo personalInfo, Map<int, double> chapterProgress
});


$PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class _$PlaybookScreenStateCopyWithImpl<$Res>
    implements $PlaybookScreenStateCopyWith<$Res> {
  _$PlaybookScreenStateCopyWithImpl(this._self, this._then);

  final PlaybookScreenState _self;
  final $Res Function(PlaybookScreenState) _then;

/// Create a copy of PlaybookScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parts = null,Object? groupedChapters = null,Object? dailyTip = freezed,Object? userName = null,Object? isPersonalized = null,Object? doneChapters = null,Object? personalInfo = null,Object? chapterProgress = null,}) {
  return _then(_self.copyWith(
parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<PlaybookPart>,groupedChapters: null == groupedChapters ? _self.groupedChapters : groupedChapters // ignore: cast_nullable_to_non_nullable
as Map<String, List<PlaybookChapterItem>>,dailyTip: freezed == dailyTip ? _self.dailyTip : dailyTip // ignore: cast_nullable_to_non_nullable
as TipModel?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,isPersonalized: null == isPersonalized ? _self.isPersonalized : isPersonalized // ignore: cast_nullable_to_non_nullable
as bool,doneChapters: null == doneChapters ? _self.doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,chapterProgress: null == chapterProgress ? _self.chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as Map<int, double>,
  ));
}
/// Create a copy of PlaybookScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaybookScreenState].
extension PlaybookScreenStatePatterns on PlaybookScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybookScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybookScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybookScreenState value)  $default,){
final _that = this;
switch (_that) {
case _PlaybookScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybookScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybookScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlaybookPart> parts,  Map<String, List<PlaybookChapterItem>> groupedChapters,  TipModel? dailyTip,  String userName,  bool isPersonalized,  Set<int> doneChapters,  PersonalInfo personalInfo,  Map<int, double> chapterProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybookScreenState() when $default != null:
return $default(_that.parts,_that.groupedChapters,_that.dailyTip,_that.userName,_that.isPersonalized,_that.doneChapters,_that.personalInfo,_that.chapterProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlaybookPart> parts,  Map<String, List<PlaybookChapterItem>> groupedChapters,  TipModel? dailyTip,  String userName,  bool isPersonalized,  Set<int> doneChapters,  PersonalInfo personalInfo,  Map<int, double> chapterProgress)  $default,) {final _that = this;
switch (_that) {
case _PlaybookScreenState():
return $default(_that.parts,_that.groupedChapters,_that.dailyTip,_that.userName,_that.isPersonalized,_that.doneChapters,_that.personalInfo,_that.chapterProgress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlaybookPart> parts,  Map<String, List<PlaybookChapterItem>> groupedChapters,  TipModel? dailyTip,  String userName,  bool isPersonalized,  Set<int> doneChapters,  PersonalInfo personalInfo,  Map<int, double> chapterProgress)?  $default,) {final _that = this;
switch (_that) {
case _PlaybookScreenState() when $default != null:
return $default(_that.parts,_that.groupedChapters,_that.dailyTip,_that.userName,_that.isPersonalized,_that.doneChapters,_that.personalInfo,_that.chapterProgress);case _:
  return null;

}
}

}

/// @nodoc


class _PlaybookScreenState extends PlaybookScreenState {
  const _PlaybookScreenState({required final  List<PlaybookPart> parts, required final  Map<String, List<PlaybookChapterItem>> groupedChapters, required this.dailyTip, required this.userName, required this.isPersonalized, required final  Set<int> doneChapters, required this.personalInfo, required final  Map<int, double> chapterProgress}): _parts = parts,_groupedChapters = groupedChapters,_doneChapters = doneChapters,_chapterProgress = chapterProgress,super._();
  

 final  List<PlaybookPart> _parts;
@override List<PlaybookPart> get parts {
  if (_parts is EqualUnmodifiableListView) return _parts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parts);
}

 final  Map<String, List<PlaybookChapterItem>> _groupedChapters;
@override Map<String, List<PlaybookChapterItem>> get groupedChapters {
  if (_groupedChapters is EqualUnmodifiableMapView) return _groupedChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groupedChapters);
}

@override final  TipModel? dailyTip;
@override final  String userName;
@override final  bool isPersonalized;
 final  Set<int> _doneChapters;
@override Set<int> get doneChapters {
  if (_doneChapters is EqualUnmodifiableSetView) return _doneChapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_doneChapters);
}

@override final  PersonalInfo personalInfo;
/// progress per chapter 0..1
 final  Map<int, double> _chapterProgress;
/// progress per chapter 0..1
@override Map<int, double> get chapterProgress {
  if (_chapterProgress is EqualUnmodifiableMapView) return _chapterProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_chapterProgress);
}


/// Create a copy of PlaybookScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybookScreenStateCopyWith<_PlaybookScreenState> get copyWith => __$PlaybookScreenStateCopyWithImpl<_PlaybookScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybookScreenState&&const DeepCollectionEquality().equals(other._parts, _parts)&&const DeepCollectionEquality().equals(other._groupedChapters, _groupedChapters)&&(identical(other.dailyTip, dailyTip) || other.dailyTip == dailyTip)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.isPersonalized, isPersonalized) || other.isPersonalized == isPersonalized)&&const DeepCollectionEquality().equals(other._doneChapters, _doneChapters)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other._chapterProgress, _chapterProgress));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_parts),const DeepCollectionEquality().hash(_groupedChapters),dailyTip,userName,isPersonalized,const DeepCollectionEquality().hash(_doneChapters),personalInfo,const DeepCollectionEquality().hash(_chapterProgress));

@override
String toString() {
  return 'PlaybookScreenState(parts: $parts, groupedChapters: $groupedChapters, dailyTip: $dailyTip, userName: $userName, isPersonalized: $isPersonalized, doneChapters: $doneChapters, personalInfo: $personalInfo, chapterProgress: $chapterProgress)';
}


}

/// @nodoc
abstract mixin class _$PlaybookScreenStateCopyWith<$Res> implements $PlaybookScreenStateCopyWith<$Res> {
  factory _$PlaybookScreenStateCopyWith(_PlaybookScreenState value, $Res Function(_PlaybookScreenState) _then) = __$PlaybookScreenStateCopyWithImpl;
@override @useResult
$Res call({
 List<PlaybookPart> parts, Map<String, List<PlaybookChapterItem>> groupedChapters, TipModel? dailyTip, String userName, bool isPersonalized, Set<int> doneChapters, PersonalInfo personalInfo, Map<int, double> chapterProgress
});


@override $PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class __$PlaybookScreenStateCopyWithImpl<$Res>
    implements _$PlaybookScreenStateCopyWith<$Res> {
  __$PlaybookScreenStateCopyWithImpl(this._self, this._then);

  final _PlaybookScreenState _self;
  final $Res Function(_PlaybookScreenState) _then;

/// Create a copy of PlaybookScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? parts = null,Object? groupedChapters = null,Object? dailyTip = freezed,Object? userName = null,Object? isPersonalized = null,Object? doneChapters = null,Object? personalInfo = null,Object? chapterProgress = null,}) {
  return _then(_PlaybookScreenState(
parts: null == parts ? _self._parts : parts // ignore: cast_nullable_to_non_nullable
as List<PlaybookPart>,groupedChapters: null == groupedChapters ? _self._groupedChapters : groupedChapters // ignore: cast_nullable_to_non_nullable
as Map<String, List<PlaybookChapterItem>>,dailyTip: freezed == dailyTip ? _self.dailyTip : dailyTip // ignore: cast_nullable_to_non_nullable
as TipModel?,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,isPersonalized: null == isPersonalized ? _self.isPersonalized : isPersonalized // ignore: cast_nullable_to_non_nullable
as bool,doneChapters: null == doneChapters ? _self._doneChapters : doneChapters // ignore: cast_nullable_to_non_nullable
as Set<int>,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,chapterProgress: null == chapterProgress ? _self._chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as Map<int, double>,
  ));
}

/// Create a copy of PlaybookScreenState
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
