// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_overview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceOverviewState {

 BaseStatus get status; List<MaintenanceItem> get items; String? get error;
/// Create a copy of MaintenanceOverviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceOverviewStateCopyWith<MaintenanceOverviewState> get copyWith => _$MaintenanceOverviewStateCopyWithImpl<MaintenanceOverviewState>(this as MaintenanceOverviewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceOverviewState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),error);

@override
String toString() {
  return 'MaintenanceOverviewState(status: $status, items: $items, error: $error)';
}


}

/// @nodoc
abstract mixin class $MaintenanceOverviewStateCopyWith<$Res>  {
  factory $MaintenanceOverviewStateCopyWith(MaintenanceOverviewState value, $Res Function(MaintenanceOverviewState) _then) = _$MaintenanceOverviewStateCopyWithImpl;
@useResult
$Res call({
 BaseStatus status, List<MaintenanceItem> items, String? error
});




}
/// @nodoc
class _$MaintenanceOverviewStateCopyWithImpl<$Res>
    implements $MaintenanceOverviewStateCopyWith<$Res> {
  _$MaintenanceOverviewStateCopyWithImpl(this._self, this._then);

  final MaintenanceOverviewState _self;
  final $Res Function(MaintenanceOverviewState) _then;

/// Create a copy of MaintenanceOverviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MaintenanceItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceOverviewState].
extension MaintenanceOverviewStatePatterns on MaintenanceOverviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceOverviewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceOverviewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceOverviewState value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceOverviewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceOverviewState value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceOverviewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseStatus status,  List<MaintenanceItem> items,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceOverviewState() when $default != null:
return $default(_that.status,_that.items,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseStatus status,  List<MaintenanceItem> items,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceOverviewState():
return $default(_that.status,_that.items,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseStatus status,  List<MaintenanceItem> items,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceOverviewState() when $default != null:
return $default(_that.status,_that.items,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceOverviewState implements MaintenanceOverviewState {
  const _MaintenanceOverviewState({this.status = BaseStatus.init, final  List<MaintenanceItem> items = const [], this.error}): _items = items;
  

@override@JsonKey() final  BaseStatus status;
 final  List<MaintenanceItem> _items;
@override@JsonKey() List<MaintenanceItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? error;

/// Create a copy of MaintenanceOverviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceOverviewStateCopyWith<_MaintenanceOverviewState> get copyWith => __$MaintenanceOverviewStateCopyWithImpl<_MaintenanceOverviewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceOverviewState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),error);

@override
String toString() {
  return 'MaintenanceOverviewState(status: $status, items: $items, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceOverviewStateCopyWith<$Res> implements $MaintenanceOverviewStateCopyWith<$Res> {
  factory _$MaintenanceOverviewStateCopyWith(_MaintenanceOverviewState value, $Res Function(_MaintenanceOverviewState) _then) = __$MaintenanceOverviewStateCopyWithImpl;
@override @useResult
$Res call({
 BaseStatus status, List<MaintenanceItem> items, String? error
});




}
/// @nodoc
class __$MaintenanceOverviewStateCopyWithImpl<$Res>
    implements _$MaintenanceOverviewStateCopyWith<$Res> {
  __$MaintenanceOverviewStateCopyWithImpl(this._self, this._then);

  final _MaintenanceOverviewState _self;
  final $Res Function(_MaintenanceOverviewState) _then;

/// Create a copy of MaintenanceOverviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? error = freezed,}) {
  return _then(_MaintenanceOverviewState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MaintenanceItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
