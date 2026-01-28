// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditTaskState {

 BaseStatus get status; Task get task; String? get error;
/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTaskStateCopyWith<EditTaskState> get copyWith => _$EditTaskStateCopyWithImpl<EditTaskState>(this as EditTaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTaskState&&(identical(other.status, status) || other.status == status)&&(identical(other.task, task) || other.task == task)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,task,error);

@override
String toString() {
  return 'EditTaskState(status: $status, task: $task, error: $error)';
}


}

/// @nodoc
abstract mixin class $EditTaskStateCopyWith<$Res>  {
  factory $EditTaskStateCopyWith(EditTaskState value, $Res Function(EditTaskState) _then) = _$EditTaskStateCopyWithImpl;
@useResult
$Res call({
 BaseStatus status, Task task, String? error
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$EditTaskStateCopyWithImpl<$Res>
    implements $EditTaskStateCopyWith<$Res> {
  _$EditTaskStateCopyWithImpl(this._self, this._then);

  final EditTaskState _self;
  final $Res Function(EditTaskState) _then;

/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? task = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}


/// Adds pattern-matching-related methods to [EditTaskState].
extension EditTaskStatePatterns on EditTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditTaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditTaskState value)  $default,){
final _that = this;
switch (_that) {
case _EditTaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditTaskState value)?  $default,){
final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseStatus status,  Task task,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
return $default(_that.status,_that.task,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseStatus status,  Task task,  String? error)  $default,) {final _that = this;
switch (_that) {
case _EditTaskState():
return $default(_that.status,_that.task,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseStatus status,  Task task,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _EditTaskState() when $default != null:
return $default(_that.status,_that.task,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EditTaskState implements EditTaskState {
  const _EditTaskState({this.status = BaseStatus.init, this.task = const Task(), this.error});
  

@override@JsonKey() final  BaseStatus status;
@override@JsonKey() final  Task task;
@override final  String? error;

/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditTaskStateCopyWith<_EditTaskState> get copyWith => __$EditTaskStateCopyWithImpl<_EditTaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditTaskState&&(identical(other.status, status) || other.status == status)&&(identical(other.task, task) || other.task == task)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,task,error);

@override
String toString() {
  return 'EditTaskState(status: $status, task: $task, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EditTaskStateCopyWith<$Res> implements $EditTaskStateCopyWith<$Res> {
  factory _$EditTaskStateCopyWith(_EditTaskState value, $Res Function(_EditTaskState) _then) = __$EditTaskStateCopyWithImpl;
@override @useResult
$Res call({
 BaseStatus status, Task task, String? error
});


@override $TaskCopyWith<$Res> get task;

}
/// @nodoc
class __$EditTaskStateCopyWithImpl<$Res>
    implements _$EditTaskStateCopyWith<$Res> {
  __$EditTaskStateCopyWithImpl(this._self, this._then);

  final _EditTaskState _self;
  final $Res Function(_EditTaskState) _then;

/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? task = null,Object? error = freezed,}) {
  return _then(_EditTaskState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EditTaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

// dart format on
