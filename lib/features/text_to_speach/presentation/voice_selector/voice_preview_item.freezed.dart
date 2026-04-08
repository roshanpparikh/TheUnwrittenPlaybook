// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_preview_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoicePreviewItem {

 TtsVoice get voice; List<int>? get bytes; bool get loading; String? get error;
/// Create a copy of VoicePreviewItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoicePreviewItemCopyWith<VoicePreviewItem> get copyWith => _$VoicePreviewItemCopyWithImpl<VoicePreviewItem>(this as VoicePreviewItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoicePreviewItem&&(identical(other.voice, voice) || other.voice == voice)&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,voice,const DeepCollectionEquality().hash(bytes),loading,error);

@override
String toString() {
  return 'VoicePreviewItem(voice: $voice, bytes: $bytes, loading: $loading, error: $error)';
}


}

/// @nodoc
abstract mixin class $VoicePreviewItemCopyWith<$Res>  {
  factory $VoicePreviewItemCopyWith(VoicePreviewItem value, $Res Function(VoicePreviewItem) _then) = _$VoicePreviewItemCopyWithImpl;
@useResult
$Res call({
 TtsVoice voice, List<int>? bytes, bool loading, String? error
});




}
/// @nodoc
class _$VoicePreviewItemCopyWithImpl<$Res>
    implements $VoicePreviewItemCopyWith<$Res> {
  _$VoicePreviewItemCopyWithImpl(this._self, this._then);

  final VoicePreviewItem _self;
  final $Res Function(VoicePreviewItem) _then;

/// Create a copy of VoicePreviewItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voice = null,Object? bytes = freezed,Object? loading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
voice: null == voice ? _self.voice : voice // ignore: cast_nullable_to_non_nullable
as TtsVoice,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as List<int>?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoicePreviewItem].
extension VoicePreviewItemPatterns on VoicePreviewItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoicePreviewItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoicePreviewItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoicePreviewItem value)  $default,){
final _that = this;
switch (_that) {
case _VoicePreviewItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoicePreviewItem value)?  $default,){
final _that = this;
switch (_that) {
case _VoicePreviewItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TtsVoice voice,  List<int>? bytes,  bool loading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoicePreviewItem() when $default != null:
return $default(_that.voice,_that.bytes,_that.loading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TtsVoice voice,  List<int>? bytes,  bool loading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _VoicePreviewItem():
return $default(_that.voice,_that.bytes,_that.loading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TtsVoice voice,  List<int>? bytes,  bool loading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _VoicePreviewItem() when $default != null:
return $default(_that.voice,_that.bytes,_that.loading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VoicePreviewItem extends VoicePreviewItem {
  const _VoicePreviewItem({required this.voice, final  List<int>? bytes, this.loading = false, this.error}): _bytes = bytes,super._();
  

@override final  TtsVoice voice;
 final  List<int>? _bytes;
@override List<int>? get bytes {
  final value = _bytes;
  if (value == null) return null;
  if (_bytes is EqualUnmodifiableListView) return _bytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool loading;
@override final  String? error;

/// Create a copy of VoicePreviewItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoicePreviewItemCopyWith<_VoicePreviewItem> get copyWith => __$VoicePreviewItemCopyWithImpl<_VoicePreviewItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoicePreviewItem&&(identical(other.voice, voice) || other.voice == voice)&&const DeepCollectionEquality().equals(other._bytes, _bytes)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,voice,const DeepCollectionEquality().hash(_bytes),loading,error);

@override
String toString() {
  return 'VoicePreviewItem(voice: $voice, bytes: $bytes, loading: $loading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VoicePreviewItemCopyWith<$Res> implements $VoicePreviewItemCopyWith<$Res> {
  factory _$VoicePreviewItemCopyWith(_VoicePreviewItem value, $Res Function(_VoicePreviewItem) _then) = __$VoicePreviewItemCopyWithImpl;
@override @useResult
$Res call({
 TtsVoice voice, List<int>? bytes, bool loading, String? error
});




}
/// @nodoc
class __$VoicePreviewItemCopyWithImpl<$Res>
    implements _$VoicePreviewItemCopyWith<$Res> {
  __$VoicePreviewItemCopyWithImpl(this._self, this._then);

  final _VoicePreviewItem _self;
  final $Res Function(_VoicePreviewItem) _then;

/// Create a copy of VoicePreviewItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voice = null,Object? bytes = freezed,Object? loading = null,Object? error = freezed,}) {
  return _then(_VoicePreviewItem(
voice: null == voice ? _self.voice : voice // ignore: cast_nullable_to_non_nullable
as TtsVoice,bytes: freezed == bytes ? _self._bytes : bytes // ignore: cast_nullable_to_non_nullable
as List<int>?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
