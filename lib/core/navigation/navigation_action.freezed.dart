// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NavigationAction()';
}


}

/// @nodoc
class $NavigationActionCopyWith<$Res>  {
$NavigationActionCopyWith(NavigationAction _, $Res Function(NavigationAction) __);
}


/// Adds pattern-matching-related methods to [NavigationAction].
extension NavigationActionPatterns on NavigationAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigationActionAdd value)?  add,TResult Function( NavigationActionAddAll value)?  addAll,TResult Function( NavigationActionAddWidget value)?  addWidget,TResult Function( NavigationActionPop value)?  pop,TResult Function( NavigationActionNone value)?  none,TResult Function( NavigationActionReplace value)?  replace,TResult Function( NavigationActionReplaceAll value)?  replaceAll,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigationActionAdd() when add != null:
return add(_that);case NavigationActionAddAll() when addAll != null:
return addAll(_that);case NavigationActionAddWidget() when addWidget != null:
return addWidget(_that);case NavigationActionPop() when pop != null:
return pop(_that);case NavigationActionNone() when none != null:
return none(_that);case NavigationActionReplace() when replace != null:
return replace(_that);case NavigationActionReplaceAll() when replaceAll != null:
return replaceAll(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigationActionAdd value)  add,required TResult Function( NavigationActionAddAll value)  addAll,required TResult Function( NavigationActionAddWidget value)  addWidget,required TResult Function( NavigationActionPop value)  pop,required TResult Function( NavigationActionNone value)  none,required TResult Function( NavigationActionReplace value)  replace,required TResult Function( NavigationActionReplaceAll value)  replaceAll,}){
final _that = this;
switch (_that) {
case NavigationActionAdd():
return add(_that);case NavigationActionAddAll():
return addAll(_that);case NavigationActionAddWidget():
return addWidget(_that);case NavigationActionPop():
return pop(_that);case NavigationActionNone():
return none(_that);case NavigationActionReplace():
return replace(_that);case NavigationActionReplaceAll():
return replaceAll(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigationActionAdd value)?  add,TResult? Function( NavigationActionAddAll value)?  addAll,TResult? Function( NavigationActionAddWidget value)?  addWidget,TResult? Function( NavigationActionPop value)?  pop,TResult? Function( NavigationActionNone value)?  none,TResult? Function( NavigationActionReplace value)?  replace,TResult? Function( NavigationActionReplaceAll value)?  replaceAll,}){
final _that = this;
switch (_that) {
case NavigationActionAdd() when add != null:
return add(_that);case NavigationActionAddAll() when addAll != null:
return addAll(_that);case NavigationActionAddWidget() when addWidget != null:
return addWidget(_that);case NavigationActionPop() when pop != null:
return pop(_that);case NavigationActionNone() when none != null:
return none(_that);case NavigationActionReplace() when replace != null:
return replace(_that);case NavigationActionReplaceAll() when replaceAll != null:
return replaceAll(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PageConfiguration configuration)?  add,TResult Function( List<PageConfiguration> configurations)?  addAll,TResult Function( Widget widget)?  addWidget,TResult Function( String? key)?  pop,TResult Function()?  none,TResult Function( PageConfiguration configuration)?  replace,TResult Function( List<PageConfiguration> configurations)?  replaceAll,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigationActionAdd() when add != null:
return add(_that.configuration);case NavigationActionAddAll() when addAll != null:
return addAll(_that.configurations);case NavigationActionAddWidget() when addWidget != null:
return addWidget(_that.widget);case NavigationActionPop() when pop != null:
return pop(_that.key);case NavigationActionNone() when none != null:
return none();case NavigationActionReplace() when replace != null:
return replace(_that.configuration);case NavigationActionReplaceAll() when replaceAll != null:
return replaceAll(_that.configurations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PageConfiguration configuration)  add,required TResult Function( List<PageConfiguration> configurations)  addAll,required TResult Function( Widget widget)  addWidget,required TResult Function( String? key)  pop,required TResult Function()  none,required TResult Function( PageConfiguration configuration)  replace,required TResult Function( List<PageConfiguration> configurations)  replaceAll,}) {final _that = this;
switch (_that) {
case NavigationActionAdd():
return add(_that.configuration);case NavigationActionAddAll():
return addAll(_that.configurations);case NavigationActionAddWidget():
return addWidget(_that.widget);case NavigationActionPop():
return pop(_that.key);case NavigationActionNone():
return none();case NavigationActionReplace():
return replace(_that.configuration);case NavigationActionReplaceAll():
return replaceAll(_that.configurations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PageConfiguration configuration)?  add,TResult? Function( List<PageConfiguration> configurations)?  addAll,TResult? Function( Widget widget)?  addWidget,TResult? Function( String? key)?  pop,TResult? Function()?  none,TResult? Function( PageConfiguration configuration)?  replace,TResult? Function( List<PageConfiguration> configurations)?  replaceAll,}) {final _that = this;
switch (_that) {
case NavigationActionAdd() when add != null:
return add(_that.configuration);case NavigationActionAddAll() when addAll != null:
return addAll(_that.configurations);case NavigationActionAddWidget() when addWidget != null:
return addWidget(_that.widget);case NavigationActionPop() when pop != null:
return pop(_that.key);case NavigationActionNone() when none != null:
return none();case NavigationActionReplace() when replace != null:
return replace(_that.configuration);case NavigationActionReplaceAll() when replaceAll != null:
return replaceAll(_that.configurations);case _:
  return null;

}
}

}

/// @nodoc


class NavigationActionAdd implements NavigationAction {
   NavigationActionAdd(this.configuration);
  

 final  PageConfiguration configuration;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionAddCopyWith<NavigationActionAdd> get copyWith => _$NavigationActionAddCopyWithImpl<NavigationActionAdd>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionAdd&&(identical(other.configuration, configuration) || other.configuration == configuration));
}


@override
int get hashCode => Object.hash(runtimeType,configuration);

@override
String toString() {
  return 'NavigationAction.add(configuration: $configuration)';
}


}

/// @nodoc
abstract mixin class $NavigationActionAddCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionAddCopyWith(NavigationActionAdd value, $Res Function(NavigationActionAdd) _then) = _$NavigationActionAddCopyWithImpl;
@useResult
$Res call({
 PageConfiguration configuration
});




}
/// @nodoc
class _$NavigationActionAddCopyWithImpl<$Res>
    implements $NavigationActionAddCopyWith<$Res> {
  _$NavigationActionAddCopyWithImpl(this._self, this._then);

  final NavigationActionAdd _self;
  final $Res Function(NavigationActionAdd) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configuration = null,}) {
  return _then(NavigationActionAdd(
null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as PageConfiguration,
  ));
}


}

/// @nodoc


class NavigationActionAddAll implements NavigationAction {
   NavigationActionAddAll(final  List<PageConfiguration> configurations): _configurations = configurations;
  

 final  List<PageConfiguration> _configurations;
 List<PageConfiguration> get configurations {
  if (_configurations is EqualUnmodifiableListView) return _configurations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configurations);
}


/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionAddAllCopyWith<NavigationActionAddAll> get copyWith => _$NavigationActionAddAllCopyWithImpl<NavigationActionAddAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionAddAll&&const DeepCollectionEquality().equals(other._configurations, _configurations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_configurations));

@override
String toString() {
  return 'NavigationAction.addAll(configurations: $configurations)';
}


}

/// @nodoc
abstract mixin class $NavigationActionAddAllCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionAddAllCopyWith(NavigationActionAddAll value, $Res Function(NavigationActionAddAll) _then) = _$NavigationActionAddAllCopyWithImpl;
@useResult
$Res call({
 List<PageConfiguration> configurations
});




}
/// @nodoc
class _$NavigationActionAddAllCopyWithImpl<$Res>
    implements $NavigationActionAddAllCopyWith<$Res> {
  _$NavigationActionAddAllCopyWithImpl(this._self, this._then);

  final NavigationActionAddAll _self;
  final $Res Function(NavigationActionAddAll) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configurations = null,}) {
  return _then(NavigationActionAddAll(
null == configurations ? _self._configurations : configurations // ignore: cast_nullable_to_non_nullable
as List<PageConfiguration>,
  ));
}


}

/// @nodoc


class NavigationActionAddWidget implements NavigationAction {
   NavigationActionAddWidget(this.widget);
  

 final  Widget widget;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionAddWidgetCopyWith<NavigationActionAddWidget> get copyWith => _$NavigationActionAddWidgetCopyWithImpl<NavigationActionAddWidget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionAddWidget&&(identical(other.widget, widget) || other.widget == widget));
}


@override
int get hashCode => Object.hash(runtimeType,widget);

@override
String toString() {
  return 'NavigationAction.addWidget(widget: $widget)';
}


}

/// @nodoc
abstract mixin class $NavigationActionAddWidgetCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionAddWidgetCopyWith(NavigationActionAddWidget value, $Res Function(NavigationActionAddWidget) _then) = _$NavigationActionAddWidgetCopyWithImpl;
@useResult
$Res call({
 Widget widget
});




}
/// @nodoc
class _$NavigationActionAddWidgetCopyWithImpl<$Res>
    implements $NavigationActionAddWidgetCopyWith<$Res> {
  _$NavigationActionAddWidgetCopyWithImpl(this._self, this._then);

  final NavigationActionAddWidget _self;
  final $Res Function(NavigationActionAddWidget) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? widget = null,}) {
  return _then(NavigationActionAddWidget(
null == widget ? _self.widget : widget // ignore: cast_nullable_to_non_nullable
as Widget,
  ));
}


}

/// @nodoc


class NavigationActionPop implements NavigationAction {
   NavigationActionPop([this.key]);
  

 final  String? key;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionPopCopyWith<NavigationActionPop> get copyWith => _$NavigationActionPopCopyWithImpl<NavigationActionPop>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionPop&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'NavigationAction.pop(key: $key)';
}


}

/// @nodoc
abstract mixin class $NavigationActionPopCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionPopCopyWith(NavigationActionPop value, $Res Function(NavigationActionPop) _then) = _$NavigationActionPopCopyWithImpl;
@useResult
$Res call({
 String? key
});




}
/// @nodoc
class _$NavigationActionPopCopyWithImpl<$Res>
    implements $NavigationActionPopCopyWith<$Res> {
  _$NavigationActionPopCopyWithImpl(this._self, this._then);

  final NavigationActionPop _self;
  final $Res Function(NavigationActionPop) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = freezed,}) {
  return _then(NavigationActionPop(
freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NavigationActionNone implements NavigationAction {
   NavigationActionNone();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionNone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NavigationAction.none()';
}


}




/// @nodoc


class NavigationActionReplace implements NavigationAction {
   NavigationActionReplace(this.configuration);
  

 final  PageConfiguration configuration;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionReplaceCopyWith<NavigationActionReplace> get copyWith => _$NavigationActionReplaceCopyWithImpl<NavigationActionReplace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionReplace&&(identical(other.configuration, configuration) || other.configuration == configuration));
}


@override
int get hashCode => Object.hash(runtimeType,configuration);

@override
String toString() {
  return 'NavigationAction.replace(configuration: $configuration)';
}


}

/// @nodoc
abstract mixin class $NavigationActionReplaceCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionReplaceCopyWith(NavigationActionReplace value, $Res Function(NavigationActionReplace) _then) = _$NavigationActionReplaceCopyWithImpl;
@useResult
$Res call({
 PageConfiguration configuration
});




}
/// @nodoc
class _$NavigationActionReplaceCopyWithImpl<$Res>
    implements $NavigationActionReplaceCopyWith<$Res> {
  _$NavigationActionReplaceCopyWithImpl(this._self, this._then);

  final NavigationActionReplace _self;
  final $Res Function(NavigationActionReplace) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configuration = null,}) {
  return _then(NavigationActionReplace(
null == configuration ? _self.configuration : configuration // ignore: cast_nullable_to_non_nullable
as PageConfiguration,
  ));
}


}

/// @nodoc


class NavigationActionReplaceAll implements NavigationAction {
   NavigationActionReplaceAll(final  List<PageConfiguration> configurations): _configurations = configurations;
  

 final  List<PageConfiguration> _configurations;
 List<PageConfiguration> get configurations {
  if (_configurations is EqualUnmodifiableListView) return _configurations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configurations);
}


/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationActionReplaceAllCopyWith<NavigationActionReplaceAll> get copyWith => _$NavigationActionReplaceAllCopyWithImpl<NavigationActionReplaceAll>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationActionReplaceAll&&const DeepCollectionEquality().equals(other._configurations, _configurations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_configurations));

@override
String toString() {
  return 'NavigationAction.replaceAll(configurations: $configurations)';
}


}

/// @nodoc
abstract mixin class $NavigationActionReplaceAllCopyWith<$Res> implements $NavigationActionCopyWith<$Res> {
  factory $NavigationActionReplaceAllCopyWith(NavigationActionReplaceAll value, $Res Function(NavigationActionReplaceAll) _then) = _$NavigationActionReplaceAllCopyWithImpl;
@useResult
$Res call({
 List<PageConfiguration> configurations
});




}
/// @nodoc
class _$NavigationActionReplaceAllCopyWithImpl<$Res>
    implements $NavigationActionReplaceAllCopyWith<$Res> {
  _$NavigationActionReplaceAllCopyWithImpl(this._self, this._then);

  final NavigationActionReplaceAll _self;
  final $Res Function(NavigationActionReplaceAll) _then;

/// Create a copy of NavigationAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configurations = null,}) {
  return _then(NavigationActionReplaceAll(
null == configurations ? _self._configurations : configurations // ignore: cast_nullable_to_non_nullable
as List<PageConfiguration>,
  ));
}


}

// dart format on
