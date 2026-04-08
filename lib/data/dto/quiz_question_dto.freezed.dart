// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
QuizQuestionDto _$QuizQuestionDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'single':
          return SingleQuestion.fromJson(
            json
          );
                case 'multi':
          return MultiQuestion.fromJson(
            json
          );
                case 'text':
          return TextQuestion.fromJson(
            json
          );
                case 'scale':
          return ScaleQuestion.fromJson(
            json
          );
                case 'scenario':
          return ScenarioQuestion.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'QuizQuestionDto',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$QuizQuestionDto {

 String get id; String get prompt;
/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizQuestionDtoCopyWith<QuizQuestionDto> get copyWith => _$QuizQuestionDtoCopyWithImpl<QuizQuestionDto>(this as QuizQuestionDto, _$identity);

  /// Serializes this QuizQuestionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizQuestionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt);

@override
String toString() {
  return 'QuizQuestionDto(id: $id, prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class $QuizQuestionDtoCopyWith<$Res>  {
  factory $QuizQuestionDtoCopyWith(QuizQuestionDto value, $Res Function(QuizQuestionDto) _then) = _$QuizQuestionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String prompt
});




}
/// @nodoc
class _$QuizQuestionDtoCopyWithImpl<$Res>
    implements $QuizQuestionDtoCopyWith<$Res> {
  _$QuizQuestionDtoCopyWithImpl(this._self, this._then);

  final QuizQuestionDto _self;
  final $Res Function(QuizQuestionDto) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prompt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizQuestionDto].
extension QuizQuestionDtoPatterns on QuizQuestionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SingleQuestion value)?  single,TResult Function( MultiQuestion value)?  multi,TResult Function( TextQuestion value)?  text,TResult Function( ScaleQuestion value)?  scale,TResult Function( ScenarioQuestion value)?  scenario,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SingleQuestion() when single != null:
return single(_that);case MultiQuestion() when multi != null:
return multi(_that);case TextQuestion() when text != null:
return text(_that);case ScaleQuestion() when scale != null:
return scale(_that);case ScenarioQuestion() when scenario != null:
return scenario(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SingleQuestion value)  single,required TResult Function( MultiQuestion value)  multi,required TResult Function( TextQuestion value)  text,required TResult Function( ScaleQuestion value)  scale,required TResult Function( ScenarioQuestion value)  scenario,}){
final _that = this;
switch (_that) {
case SingleQuestion():
return single(_that);case MultiQuestion():
return multi(_that);case TextQuestion():
return text(_that);case ScaleQuestion():
return scale(_that);case ScenarioQuestion():
return scenario(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SingleQuestion value)?  single,TResult? Function( MultiQuestion value)?  multi,TResult? Function( TextQuestion value)?  text,TResult? Function( ScaleQuestion value)?  scale,TResult? Function( ScenarioQuestion value)?  scenario,}){
final _that = this;
switch (_that) {
case SingleQuestion() when single != null:
return single(_that);case MultiQuestion() when multi != null:
return multi(_that);case TextQuestion() when text != null:
return text(_that);case ScaleQuestion() when scale != null:
return scale(_that);case ScenarioQuestion() when scenario != null:
return scenario(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)?  single,TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  int pick,  String? explanation)?  multi,TResult Function( String id,  String prompt,  ValidationRuleDto? validation,  int? minLength,  int? maxLength,  String? placeholder)?  text,TResult Function( String id,  String prompt,  int min,  int max,  int step,  String? minLabel,  String? maxLabel)?  scale,TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)?  scenario,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SingleQuestion() when single != null:
return single(_that.id,_that.prompt,_that.options,_that.explanation);case MultiQuestion() when multi != null:
return multi(_that.id,_that.prompt,_that.options,_that.pick,_that.explanation);case TextQuestion() when text != null:
return text(_that.id,_that.prompt,_that.validation,_that.minLength,_that.maxLength,_that.placeholder);case ScaleQuestion() when scale != null:
return scale(_that.id,_that.prompt,_that.min,_that.max,_that.step,_that.minLabel,_that.maxLabel);case ScenarioQuestion() when scenario != null:
return scenario(_that.id,_that.prompt,_that.options,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)  single,required TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  int pick,  String? explanation)  multi,required TResult Function( String id,  String prompt,  ValidationRuleDto? validation,  int? minLength,  int? maxLength,  String? placeholder)  text,required TResult Function( String id,  String prompt,  int min,  int max,  int step,  String? minLabel,  String? maxLabel)  scale,required TResult Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)  scenario,}) {final _that = this;
switch (_that) {
case SingleQuestion():
return single(_that.id,_that.prompt,_that.options,_that.explanation);case MultiQuestion():
return multi(_that.id,_that.prompt,_that.options,_that.pick,_that.explanation);case TextQuestion():
return text(_that.id,_that.prompt,_that.validation,_that.minLength,_that.maxLength,_that.placeholder);case ScaleQuestion():
return scale(_that.id,_that.prompt,_that.min,_that.max,_that.step,_that.minLabel,_that.maxLabel);case ScenarioQuestion():
return scenario(_that.id,_that.prompt,_that.options,_that.explanation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)?  single,TResult? Function( String id,  String prompt,  List<QuizOptionDto> options,  int pick,  String? explanation)?  multi,TResult? Function( String id,  String prompt,  ValidationRuleDto? validation,  int? minLength,  int? maxLength,  String? placeholder)?  text,TResult? Function( String id,  String prompt,  int min,  int max,  int step,  String? minLabel,  String? maxLabel)?  scale,TResult? Function( String id,  String prompt,  List<QuizOptionDto> options,  String? explanation)?  scenario,}) {final _that = this;
switch (_that) {
case SingleQuestion() when single != null:
return single(_that.id,_that.prompt,_that.options,_that.explanation);case MultiQuestion() when multi != null:
return multi(_that.id,_that.prompt,_that.options,_that.pick,_that.explanation);case TextQuestion() when text != null:
return text(_that.id,_that.prompt,_that.validation,_that.minLength,_that.maxLength,_that.placeholder);case ScaleQuestion() when scale != null:
return scale(_that.id,_that.prompt,_that.min,_that.max,_that.step,_that.minLabel,_that.maxLabel);case ScenarioQuestion() when scenario != null:
return scenario(_that.id,_that.prompt,_that.options,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class SingleQuestion extends QuizQuestionDto {
  const SingleQuestion({required this.id, required this.prompt, required final  List<QuizOptionDto> options, this.explanation, final  String? $type}): _options = options,$type = $type ?? 'single',super._();
  factory SingleQuestion.fromJson(Map<String, dynamic> json) => _$SingleQuestionFromJson(json);

@override final  String id;
@override final  String prompt;
 final  List<QuizOptionDto> _options;
 List<QuizOptionDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleQuestionCopyWith<SingleQuestion> get copyWith => _$SingleQuestionCopyWithImpl<SingleQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingleQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,const DeepCollectionEquality().hash(_options),explanation);

@override
String toString() {
  return 'QuizQuestionDto.single(id: $id, prompt: $prompt, options: $options, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $SingleQuestionCopyWith<$Res> implements $QuizQuestionDtoCopyWith<$Res> {
  factory $SingleQuestionCopyWith(SingleQuestion value, $Res Function(SingleQuestion) _then) = _$SingleQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, List<QuizOptionDto> options, String? explanation
});




}
/// @nodoc
class _$SingleQuestionCopyWithImpl<$Res>
    implements $SingleQuestionCopyWith<$Res> {
  _$SingleQuestionCopyWithImpl(this._self, this._then);

  final SingleQuestion _self;
  final $Res Function(SingleQuestion) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? options = null,Object? explanation = freezed,}) {
  return _then(SingleQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<QuizOptionDto>,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MultiQuestion extends QuizQuestionDto {
  const MultiQuestion({required this.id, required this.prompt, required final  List<QuizOptionDto> options, this.pick = 2, this.explanation, final  String? $type}): _options = options,$type = $type ?? 'multi',super._();
  factory MultiQuestion.fromJson(Map<String, dynamic> json) => _$MultiQuestionFromJson(json);

@override final  String id;
@override final  String prompt;
 final  List<QuizOptionDto> _options;
 List<QuizOptionDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@JsonKey() final  int pick;
 final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiQuestionCopyWith<MultiQuestion> get copyWith => _$MultiQuestionCopyWithImpl<MultiQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MultiQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.pick, pick) || other.pick == pick)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,const DeepCollectionEquality().hash(_options),pick,explanation);

@override
String toString() {
  return 'QuizQuestionDto.multi(id: $id, prompt: $prompt, options: $options, pick: $pick, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $MultiQuestionCopyWith<$Res> implements $QuizQuestionDtoCopyWith<$Res> {
  factory $MultiQuestionCopyWith(MultiQuestion value, $Res Function(MultiQuestion) _then) = _$MultiQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, List<QuizOptionDto> options, int pick, String? explanation
});




}
/// @nodoc
class _$MultiQuestionCopyWithImpl<$Res>
    implements $MultiQuestionCopyWith<$Res> {
  _$MultiQuestionCopyWithImpl(this._self, this._then);

  final MultiQuestion _self;
  final $Res Function(MultiQuestion) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? options = null,Object? pick = null,Object? explanation = freezed,}) {
  return _then(MultiQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<QuizOptionDto>,pick: null == pick ? _self.pick : pick // ignore: cast_nullable_to_non_nullable
as int,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TextQuestion extends QuizQuestionDto {
  const TextQuestion({required this.id, required this.prompt, this.validation, this.minLength, this.maxLength, this.placeholder, final  String? $type}): $type = $type ?? 'text',super._();
  factory TextQuestion.fromJson(Map<String, dynamic> json) => _$TextQuestionFromJson(json);

@override final  String id;
@override final  String prompt;
 final  ValidationRuleDto? validation;
 final  int? minLength;
 final  int? maxLength;
 final  String? placeholder;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextQuestionCopyWith<TextQuestion> get copyWith => _$TextQuestionCopyWithImpl<TextQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.validation, validation) || other.validation == validation)&&(identical(other.minLength, minLength) || other.minLength == minLength)&&(identical(other.maxLength, maxLength) || other.maxLength == maxLength)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,validation,minLength,maxLength,placeholder);

@override
String toString() {
  return 'QuizQuestionDto.text(id: $id, prompt: $prompt, validation: $validation, minLength: $minLength, maxLength: $maxLength, placeholder: $placeholder)';
}


}

/// @nodoc
abstract mixin class $TextQuestionCopyWith<$Res> implements $QuizQuestionDtoCopyWith<$Res> {
  factory $TextQuestionCopyWith(TextQuestion value, $Res Function(TextQuestion) _then) = _$TextQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, ValidationRuleDto? validation, int? minLength, int? maxLength, String? placeholder
});


$ValidationRuleDtoCopyWith<$Res>? get validation;

}
/// @nodoc
class _$TextQuestionCopyWithImpl<$Res>
    implements $TextQuestionCopyWith<$Res> {
  _$TextQuestionCopyWithImpl(this._self, this._then);

  final TextQuestion _self;
  final $Res Function(TextQuestion) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? validation = freezed,Object? minLength = freezed,Object? maxLength = freezed,Object? placeholder = freezed,}) {
  return _then(TextQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,validation: freezed == validation ? _self.validation : validation // ignore: cast_nullable_to_non_nullable
as ValidationRuleDto?,minLength: freezed == minLength ? _self.minLength : minLength // ignore: cast_nullable_to_non_nullable
as int?,maxLength: freezed == maxLength ? _self.maxLength : maxLength // ignore: cast_nullable_to_non_nullable
as int?,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ValidationRuleDtoCopyWith<$Res>? get validation {
    if (_self.validation == null) {
    return null;
  }

  return $ValidationRuleDtoCopyWith<$Res>(_self.validation!, (value) {
    return _then(_self.copyWith(validation: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ScaleQuestion extends QuizQuestionDto {
  const ScaleQuestion({required this.id, required this.prompt, this.min = 1, this.max = 5, this.step = 1, this.minLabel, this.maxLabel, final  String? $type}): $type = $type ?? 'scale',super._();
  factory ScaleQuestion.fromJson(Map<String, dynamic> json) => _$ScaleQuestionFromJson(json);

@override final  String id;
@override final  String prompt;
@JsonKey() final  int min;
@JsonKey() final  int max;
@JsonKey() final  int step;
 final  String? minLabel;
 final  String? maxLabel;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScaleQuestionCopyWith<ScaleQuestion> get copyWith => _$ScaleQuestionCopyWithImpl<ScaleQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScaleQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScaleQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.step, step) || other.step == step)&&(identical(other.minLabel, minLabel) || other.minLabel == minLabel)&&(identical(other.maxLabel, maxLabel) || other.maxLabel == maxLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,min,max,step,minLabel,maxLabel);

@override
String toString() {
  return 'QuizQuestionDto.scale(id: $id, prompt: $prompt, min: $min, max: $max, step: $step, minLabel: $minLabel, maxLabel: $maxLabel)';
}


}

/// @nodoc
abstract mixin class $ScaleQuestionCopyWith<$Res> implements $QuizQuestionDtoCopyWith<$Res> {
  factory $ScaleQuestionCopyWith(ScaleQuestion value, $Res Function(ScaleQuestion) _then) = _$ScaleQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, int min, int max, int step, String? minLabel, String? maxLabel
});




}
/// @nodoc
class _$ScaleQuestionCopyWithImpl<$Res>
    implements $ScaleQuestionCopyWith<$Res> {
  _$ScaleQuestionCopyWithImpl(this._self, this._then);

  final ScaleQuestion _self;
  final $Res Function(ScaleQuestion) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? min = null,Object? max = null,Object? step = null,Object? minLabel = freezed,Object? maxLabel = freezed,}) {
  return _then(ScaleQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,minLabel: freezed == minLabel ? _self.minLabel : minLabel // ignore: cast_nullable_to_non_nullable
as String?,maxLabel: freezed == maxLabel ? _self.maxLabel : maxLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ScenarioQuestion extends QuizQuestionDto {
  const ScenarioQuestion({required this.id, required this.prompt, required final  List<QuizOptionDto> options, this.explanation, final  String? $type}): _options = options,$type = $type ?? 'scenario',super._();
  factory ScenarioQuestion.fromJson(Map<String, dynamic> json) => _$ScenarioQuestionFromJson(json);

@override final  String id;
@override final  String prompt;
 final  List<QuizOptionDto> _options;
 List<QuizOptionDto> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  String? explanation;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScenarioQuestionCopyWith<ScenarioQuestion> get copyWith => _$ScenarioQuestionCopyWithImpl<ScenarioQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScenarioQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScenarioQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,const DeepCollectionEquality().hash(_options),explanation);

@override
String toString() {
  return 'QuizQuestionDto.scenario(id: $id, prompt: $prompt, options: $options, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ScenarioQuestionCopyWith<$Res> implements $QuizQuestionDtoCopyWith<$Res> {
  factory $ScenarioQuestionCopyWith(ScenarioQuestion value, $Res Function(ScenarioQuestion) _then) = _$ScenarioQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String prompt, List<QuizOptionDto> options, String? explanation
});




}
/// @nodoc
class _$ScenarioQuestionCopyWithImpl<$Res>
    implements $ScenarioQuestionCopyWith<$Res> {
  _$ScenarioQuestionCopyWithImpl(this._self, this._then);

  final ScenarioQuestion _self;
  final $Res Function(ScenarioQuestion) _then;

/// Create a copy of QuizQuestionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? options = null,Object? explanation = freezed,}) {
  return _then(ScenarioQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<QuizOptionDto>,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
