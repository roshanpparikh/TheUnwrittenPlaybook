// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalInfo {

// ── Core identity ────────────────────────────────────────────────────────
 String get name;/// 'male' | 'female' | 'nonbinary'
 Gender? get gender;// ── Onboarding quiz answers ─────────────────────────────────────────────
/// 'new_grad' | 'rising' | 'established' | 'executive'
 String? get lifeStage;/// 'medicine' | 'law' | 'finance' | 'tech' | 'other'
 String? get field;/// 'fish' | 'some' | 'mostly'
 String? get confidence;/// Selected interest tags: 'wine' | 'dining' | 'fashion' | 'watches' |
/// 'cars' | 'art' | 'travel' | 'golf' | 'boats' | 'fitness' | 'money' | 'philanthropy'
 List<String> get interests;/// 'central' | 'private' | 'exploring' | 'secular'
 String? get faith;/// 'now' | 'building' | 'long'
 String? get urgency;
/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<PersonalInfo> get copyWith => _$PersonalInfoCopyWithImpl<PersonalInfo>(this as PersonalInfo, _$identity);

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.lifeStage, lifeStage) || other.lifeStage == lifeStage)&&(identical(other.field, field) || other.field == field)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.faith, faith) || other.faith == faith)&&(identical(other.urgency, urgency) || other.urgency == urgency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,gender,lifeStage,field,confidence,const DeepCollectionEquality().hash(interests),faith,urgency);

@override
String toString() {
  return 'PersonalInfo(name: $name, gender: $gender, lifeStage: $lifeStage, field: $field, confidence: $confidence, interests: $interests, faith: $faith, urgency: $urgency)';
}


}

/// @nodoc
abstract mixin class $PersonalInfoCopyWith<$Res>  {
  factory $PersonalInfoCopyWith(PersonalInfo value, $Res Function(PersonalInfo) _then) = _$PersonalInfoCopyWithImpl;
@useResult
$Res call({
 String name, Gender? gender, String? lifeStage, String? field, String? confidence, List<String> interests, String? faith, String? urgency
});




}
/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._self, this._then);

  final PersonalInfo _self;
  final $Res Function(PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? gender = freezed,Object? lifeStage = freezed,Object? field = freezed,Object? confidence = freezed,Object? interests = null,Object? faith = freezed,Object? urgency = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,lifeStage: freezed == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as String?,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,faith: freezed == faith ? _self.faith : faith // ignore: cast_nullable_to_non_nullable
as String?,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalInfo].
extension PersonalInfoPatterns on PersonalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInfo value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Gender? gender,  String? lifeStage,  String? field,  String? confidence,  List<String> interests,  String? faith,  String? urgency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.name,_that.gender,_that.lifeStage,_that.field,_that.confidence,_that.interests,_that.faith,_that.urgency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Gender? gender,  String? lifeStage,  String? field,  String? confidence,  List<String> interests,  String? faith,  String? urgency)  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo():
return $default(_that.name,_that.gender,_that.lifeStage,_that.field,_that.confidence,_that.interests,_that.faith,_that.urgency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Gender? gender,  String? lifeStage,  String? field,  String? confidence,  List<String> interests,  String? faith,  String? urgency)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.name,_that.gender,_that.lifeStage,_that.field,_that.confidence,_that.interests,_that.faith,_that.urgency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalInfo extends PersonalInfo {
  const _PersonalInfo({this.name = '', this.gender, this.lifeStage, this.field, this.confidence, final  List<String> interests = const <String>[], this.faith, this.urgency}): _interests = interests,super._();
  factory _PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);

// ── Core identity ────────────────────────────────────────────────────────
@override@JsonKey() final  String name;
/// 'male' | 'female' | 'nonbinary'
@override final  Gender? gender;
// ── Onboarding quiz answers ─────────────────────────────────────────────
/// 'new_grad' | 'rising' | 'established' | 'executive'
@override final  String? lifeStage;
/// 'medicine' | 'law' | 'finance' | 'tech' | 'other'
@override final  String? field;
/// 'fish' | 'some' | 'mostly'
@override final  String? confidence;
/// Selected interest tags: 'wine' | 'dining' | 'fashion' | 'watches' |
/// 'cars' | 'art' | 'travel' | 'golf' | 'boats' | 'fitness' | 'money' | 'philanthropy'
 final  List<String> _interests;
/// Selected interest tags: 'wine' | 'dining' | 'fashion' | 'watches' |
/// 'cars' | 'art' | 'travel' | 'golf' | 'boats' | 'fitness' | 'money' | 'philanthropy'
@override@JsonKey() List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

/// 'central' | 'private' | 'exploring' | 'secular'
@override final  String? faith;
/// 'now' | 'building' | 'long'
@override final  String? urgency;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoCopyWith<_PersonalInfo> get copyWith => __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.lifeStage, lifeStage) || other.lifeStage == lifeStage)&&(identical(other.field, field) || other.field == field)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.faith, faith) || other.faith == faith)&&(identical(other.urgency, urgency) || other.urgency == urgency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,gender,lifeStage,field,confidence,const DeepCollectionEquality().hash(_interests),faith,urgency);

@override
String toString() {
  return 'PersonalInfo(name: $name, gender: $gender, lifeStage: $lifeStage, field: $field, confidence: $confidence, interests: $interests, faith: $faith, urgency: $urgency)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoCopyWith<$Res> implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(_PersonalInfo value, $Res Function(_PersonalInfo) _then) = __$PersonalInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, Gender? gender, String? lifeStage, String? field, String? confidence, List<String> interests, String? faith, String? urgency
});




}
/// @nodoc
class __$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(this._self, this._then);

  final _PersonalInfo _self;
  final $Res Function(_PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? gender = freezed,Object? lifeStage = freezed,Object? field = freezed,Object? confidence = freezed,Object? interests = null,Object? faith = freezed,Object? urgency = freezed,}) {
  return _then(_PersonalInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,lifeStage: freezed == lifeStage ? _self.lifeStage : lifeStage // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as String?,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,faith: freezed == faith ? _self.faith : faith // ignore: cast_nullable_to_non_nullable
as String?,urgency: freezed == urgency ? _self.urgency : urgency // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
