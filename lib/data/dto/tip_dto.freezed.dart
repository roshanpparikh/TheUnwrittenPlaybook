// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TipDto {

 String get type; String get label; String get content;
/// Create a copy of TipDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TipDtoCopyWith<TipDto> get copyWith => _$TipDtoCopyWithImpl<TipDto>(this as TipDto, _$identity);

  /// Serializes this TipDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TipDto&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,label,content);

@override
String toString() {
  return 'TipDto(type: $type, label: $label, content: $content)';
}


}

/// @nodoc
abstract mixin class $TipDtoCopyWith<$Res>  {
  factory $TipDtoCopyWith(TipDto value, $Res Function(TipDto) _then) = _$TipDtoCopyWithImpl;
@useResult
$Res call({
 String type, String label, String content
});




}
/// @nodoc
class _$TipDtoCopyWithImpl<$Res>
    implements $TipDtoCopyWith<$Res> {
  _$TipDtoCopyWithImpl(this._self, this._then);

  final TipDto _self;
  final $Res Function(TipDto) _then;

/// Create a copy of TipDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? label = null,Object? content = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TipDto].
extension TipDtoPatterns on TipDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TipDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TipDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TipDto value)  $default,){
final _that = this;
switch (_that) {
case _TipDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TipDto value)?  $default,){
final _that = this;
switch (_that) {
case _TipDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String label,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TipDto() when $default != null:
return $default(_that.type,_that.label,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String label,  String content)  $default,) {final _that = this;
switch (_that) {
case _TipDto():
return $default(_that.type,_that.label,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String label,  String content)?  $default,) {final _that = this;
switch (_that) {
case _TipDto() when $default != null:
return $default(_that.type,_that.label,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TipDto extends TipDto {
  const _TipDto({required this.type, required this.label, required this.content}): super._();
  factory _TipDto.fromJson(Map<String, dynamic> json) => _$TipDtoFromJson(json);

@override final  String type;
@override final  String label;
@override final  String content;

/// Create a copy of TipDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TipDtoCopyWith<_TipDto> get copyWith => __$TipDtoCopyWithImpl<_TipDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TipDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TipDto&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,label,content);

@override
String toString() {
  return 'TipDto(type: $type, label: $label, content: $content)';
}


}

/// @nodoc
abstract mixin class _$TipDtoCopyWith<$Res> implements $TipDtoCopyWith<$Res> {
  factory _$TipDtoCopyWith(_TipDto value, $Res Function(_TipDto) _then) = __$TipDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String label, String content
});




}
/// @nodoc
class __$TipDtoCopyWithImpl<$Res>
    implements _$TipDtoCopyWith<$Res> {
  __$TipDtoCopyWithImpl(this._self, this._then);

  final _TipDto _self;
  final $Res Function(_TipDto) _then;

/// Create a copy of TipDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? label = null,Object? content = null,}) {
  return _then(_TipDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
