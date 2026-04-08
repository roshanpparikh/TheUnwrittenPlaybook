// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceSelectionState {

 List<VoicePreviewItem> get voices; VoicePreviewItem? get selectedVoice; bool get isSaving; String? get error;
/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSelectionStateCopyWith<VoiceSelectionState> get copyWith => _$VoiceSelectionStateCopyWithImpl<VoiceSelectionState>(this as VoiceSelectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSelectionState&&const DeepCollectionEquality().equals(other.voices, voices)&&(identical(other.selectedVoice, selectedVoice) || other.selectedVoice == selectedVoice)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(voices),selectedVoice,isSaving,error);

@override
String toString() {
  return 'VoiceSelectionState(voices: $voices, selectedVoice: $selectedVoice, isSaving: $isSaving, error: $error)';
}


}

/// @nodoc
abstract mixin class $VoiceSelectionStateCopyWith<$Res>  {
  factory $VoiceSelectionStateCopyWith(VoiceSelectionState value, $Res Function(VoiceSelectionState) _then) = _$VoiceSelectionStateCopyWithImpl;
@useResult
$Res call({
 List<VoicePreviewItem> voices, VoicePreviewItem? selectedVoice, bool isSaving, String? error
});


$VoicePreviewItemCopyWith<$Res>? get selectedVoice;

}
/// @nodoc
class _$VoiceSelectionStateCopyWithImpl<$Res>
    implements $VoiceSelectionStateCopyWith<$Res> {
  _$VoiceSelectionStateCopyWithImpl(this._self, this._then);

  final VoiceSelectionState _self;
  final $Res Function(VoiceSelectionState) _then;

/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voices = null,Object? selectedVoice = freezed,Object? isSaving = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
voices: null == voices ? _self.voices : voices // ignore: cast_nullable_to_non_nullable
as List<VoicePreviewItem>,selectedVoice: freezed == selectedVoice ? _self.selectedVoice : selectedVoice // ignore: cast_nullable_to_non_nullable
as VoicePreviewItem?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoicePreviewItemCopyWith<$Res>? get selectedVoice {
    if (_self.selectedVoice == null) {
    return null;
  }

  return $VoicePreviewItemCopyWith<$Res>(_self.selectedVoice!, (value) {
    return _then(_self.copyWith(selectedVoice: value));
  });
}
}


/// Adds pattern-matching-related methods to [VoiceSelectionState].
extension VoiceSelectionStatePatterns on VoiceSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _VoiceSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VoicePreviewItem> voices,  VoicePreviewItem? selectedVoice,  bool isSaving,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceSelectionState() when $default != null:
return $default(_that.voices,_that.selectedVoice,_that.isSaving,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VoicePreviewItem> voices,  VoicePreviewItem? selectedVoice,  bool isSaving,  String? error)  $default,) {final _that = this;
switch (_that) {
case _VoiceSelectionState():
return $default(_that.voices,_that.selectedVoice,_that.isSaving,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VoicePreviewItem> voices,  VoicePreviewItem? selectedVoice,  bool isSaving,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _VoiceSelectionState() when $default != null:
return $default(_that.voices,_that.selectedVoice,_that.isSaving,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _VoiceSelectionState extends VoiceSelectionState {
  const _VoiceSelectionState({required final  List<VoicePreviewItem> voices, this.selectedVoice, this.isSaving = false, this.error}): _voices = voices,super._();
  

 final  List<VoicePreviewItem> _voices;
@override List<VoicePreviewItem> get voices {
  if (_voices is EqualUnmodifiableListView) return _voices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_voices);
}

@override final  VoicePreviewItem? selectedVoice;
@override@JsonKey() final  bool isSaving;
@override final  String? error;

/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceSelectionStateCopyWith<_VoiceSelectionState> get copyWith => __$VoiceSelectionStateCopyWithImpl<_VoiceSelectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceSelectionState&&const DeepCollectionEquality().equals(other._voices, _voices)&&(identical(other.selectedVoice, selectedVoice) || other.selectedVoice == selectedVoice)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_voices),selectedVoice,isSaving,error);

@override
String toString() {
  return 'VoiceSelectionState(voices: $voices, selectedVoice: $selectedVoice, isSaving: $isSaving, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VoiceSelectionStateCopyWith<$Res> implements $VoiceSelectionStateCopyWith<$Res> {
  factory _$VoiceSelectionStateCopyWith(_VoiceSelectionState value, $Res Function(_VoiceSelectionState) _then) = __$VoiceSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 List<VoicePreviewItem> voices, VoicePreviewItem? selectedVoice, bool isSaving, String? error
});


@override $VoicePreviewItemCopyWith<$Res>? get selectedVoice;

}
/// @nodoc
class __$VoiceSelectionStateCopyWithImpl<$Res>
    implements _$VoiceSelectionStateCopyWith<$Res> {
  __$VoiceSelectionStateCopyWithImpl(this._self, this._then);

  final _VoiceSelectionState _self;
  final $Res Function(_VoiceSelectionState) _then;

/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voices = null,Object? selectedVoice = freezed,Object? isSaving = null,Object? error = freezed,}) {
  return _then(_VoiceSelectionState(
voices: null == voices ? _self._voices : voices // ignore: cast_nullable_to_non_nullable
as List<VoicePreviewItem>,selectedVoice: freezed == selectedVoice ? _self.selectedVoice : selectedVoice // ignore: cast_nullable_to_non_nullable
as VoicePreviewItem?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VoiceSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoicePreviewItemCopyWith<$Res>? get selectedVoice {
    if (_self.selectedVoice == null) {
    return null;
  }

  return $VoicePreviewItemCopyWith<$Res>(_self.selectedVoice!, (value) {
    return _then(_self.copyWith(selectedVoice: value));
  });
}
}

// dart format on
