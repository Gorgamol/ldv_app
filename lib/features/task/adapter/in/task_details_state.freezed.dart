// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskDetailsState {

 BaseStatus get status; Task get task; Task? get editedTask; bool get isEditMode; bool get isCreationMode; bool get taskCreated; bool get taskUpdated; bool get taskDeleted; String? get error;
/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailsStateCopyWith<TaskDetailsState> get copyWith => _$TaskDetailsStateCopyWithImpl<TaskDetailsState>(this as TaskDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.task, task) || other.task == task)&&(identical(other.editedTask, editedTask) || other.editedTask == editedTask)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.isCreationMode, isCreationMode) || other.isCreationMode == isCreationMode)&&(identical(other.taskCreated, taskCreated) || other.taskCreated == taskCreated)&&(identical(other.taskUpdated, taskUpdated) || other.taskUpdated == taskUpdated)&&(identical(other.taskDeleted, taskDeleted) || other.taskDeleted == taskDeleted)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,task,editedTask,isEditMode,isCreationMode,taskCreated,taskUpdated,taskDeleted,error);

@override
String toString() {
  return 'TaskDetailsState(status: $status, task: $task, editedTask: $editedTask, isEditMode: $isEditMode, isCreationMode: $isCreationMode, taskCreated: $taskCreated, taskUpdated: $taskUpdated, taskDeleted: $taskDeleted, error: $error)';
}


}

/// @nodoc
abstract mixin class $TaskDetailsStateCopyWith<$Res>  {
  factory $TaskDetailsStateCopyWith(TaskDetailsState value, $Res Function(TaskDetailsState) _then) = _$TaskDetailsStateCopyWithImpl;
@useResult
$Res call({
 BaseStatus status, Task task, Task? editedTask, bool isEditMode, bool isCreationMode, bool taskCreated, bool taskUpdated, bool taskDeleted, String? error
});


$TaskCopyWith<$Res> get task;$TaskCopyWith<$Res>? get editedTask;

}
/// @nodoc
class _$TaskDetailsStateCopyWithImpl<$Res>
    implements $TaskDetailsStateCopyWith<$Res> {
  _$TaskDetailsStateCopyWithImpl(this._self, this._then);

  final TaskDetailsState _self;
  final $Res Function(TaskDetailsState) _then;

/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? task = null,Object? editedTask = freezed,Object? isEditMode = null,Object? isCreationMode = null,Object? taskCreated = null,Object? taskUpdated = null,Object? taskDeleted = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,editedTask: freezed == editedTask ? _self.editedTask : editedTask // ignore: cast_nullable_to_non_nullable
as Task?,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,isCreationMode: null == isCreationMode ? _self.isCreationMode : isCreationMode // ignore: cast_nullable_to_non_nullable
as bool,taskCreated: null == taskCreated ? _self.taskCreated : taskCreated // ignore: cast_nullable_to_non_nullable
as bool,taskUpdated: null == taskUpdated ? _self.taskUpdated : taskUpdated // ignore: cast_nullable_to_non_nullable
as bool,taskDeleted: null == taskDeleted ? _self.taskDeleted : taskDeleted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res>? get editedTask {
    if (_self.editedTask == null) {
    return null;
  }

  return $TaskCopyWith<$Res>(_self.editedTask!, (value) {
    return _then(_self.copyWith(editedTask: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskDetailsState].
extension TaskDetailsStatePatterns on TaskDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _TaskDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseStatus status,  Task task,  Task? editedTask,  bool isEditMode,  bool isCreationMode,  bool taskCreated,  bool taskUpdated,  bool taskDeleted,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDetailsState() when $default != null:
return $default(_that.status,_that.task,_that.editedTask,_that.isEditMode,_that.isCreationMode,_that.taskCreated,_that.taskUpdated,_that.taskDeleted,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseStatus status,  Task task,  Task? editedTask,  bool isEditMode,  bool isCreationMode,  bool taskCreated,  bool taskUpdated,  bool taskDeleted,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TaskDetailsState():
return $default(_that.status,_that.task,_that.editedTask,_that.isEditMode,_that.isCreationMode,_that.taskCreated,_that.taskUpdated,_that.taskDeleted,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseStatus status,  Task task,  Task? editedTask,  bool isEditMode,  bool isCreationMode,  bool taskCreated,  bool taskUpdated,  bool taskDeleted,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TaskDetailsState() when $default != null:
return $default(_that.status,_that.task,_that.editedTask,_that.isEditMode,_that.isCreationMode,_that.taskCreated,_that.taskUpdated,_that.taskDeleted,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TaskDetailsState implements TaskDetailsState {
  const _TaskDetailsState({this.status = BaseStatus.init, this.task = const Task(), this.editedTask = null, this.isEditMode = false, this.isCreationMode = false, this.taskCreated = false, this.taskUpdated = false, this.taskDeleted = false, this.error});
  

@override@JsonKey() final  BaseStatus status;
@override@JsonKey() final  Task task;
@override@JsonKey() final  Task? editedTask;
@override@JsonKey() final  bool isEditMode;
@override@JsonKey() final  bool isCreationMode;
@override@JsonKey() final  bool taskCreated;
@override@JsonKey() final  bool taskUpdated;
@override@JsonKey() final  bool taskDeleted;
@override final  String? error;

/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDetailsStateCopyWith<_TaskDetailsState> get copyWith => __$TaskDetailsStateCopyWithImpl<_TaskDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.task, task) || other.task == task)&&(identical(other.editedTask, editedTask) || other.editedTask == editedTask)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.isCreationMode, isCreationMode) || other.isCreationMode == isCreationMode)&&(identical(other.taskCreated, taskCreated) || other.taskCreated == taskCreated)&&(identical(other.taskUpdated, taskUpdated) || other.taskUpdated == taskUpdated)&&(identical(other.taskDeleted, taskDeleted) || other.taskDeleted == taskDeleted)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,task,editedTask,isEditMode,isCreationMode,taskCreated,taskUpdated,taskDeleted,error);

@override
String toString() {
  return 'TaskDetailsState(status: $status, task: $task, editedTask: $editedTask, isEditMode: $isEditMode, isCreationMode: $isCreationMode, taskCreated: $taskCreated, taskUpdated: $taskUpdated, taskDeleted: $taskDeleted, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TaskDetailsStateCopyWith<$Res> implements $TaskDetailsStateCopyWith<$Res> {
  factory _$TaskDetailsStateCopyWith(_TaskDetailsState value, $Res Function(_TaskDetailsState) _then) = __$TaskDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 BaseStatus status, Task task, Task? editedTask, bool isEditMode, bool isCreationMode, bool taskCreated, bool taskUpdated, bool taskDeleted, String? error
});


@override $TaskCopyWith<$Res> get task;@override $TaskCopyWith<$Res>? get editedTask;

}
/// @nodoc
class __$TaskDetailsStateCopyWithImpl<$Res>
    implements _$TaskDetailsStateCopyWith<$Res> {
  __$TaskDetailsStateCopyWithImpl(this._self, this._then);

  final _TaskDetailsState _self;
  final $Res Function(_TaskDetailsState) _then;

/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? task = null,Object? editedTask = freezed,Object? isEditMode = null,Object? isCreationMode = null,Object? taskCreated = null,Object? taskUpdated = null,Object? taskDeleted = null,Object? error = freezed,}) {
  return _then(_TaskDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,editedTask: freezed == editedTask ? _self.editedTask : editedTask // ignore: cast_nullable_to_non_nullable
as Task?,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,isCreationMode: null == isCreationMode ? _self.isCreationMode : isCreationMode // ignore: cast_nullable_to_non_nullable
as bool,taskCreated: null == taskCreated ? _self.taskCreated : taskCreated // ignore: cast_nullable_to_non_nullable
as bool,taskUpdated: null == taskUpdated ? _self.taskUpdated : taskUpdated // ignore: cast_nullable_to_non_nullable
as bool,taskDeleted: null == taskDeleted ? _self.taskDeleted : taskDeleted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res>? get editedTask {
    if (_self.editedTask == null) {
    return null;
  }

  return $TaskCopyWith<$Res>(_self.editedTask!, (value) {
    return _then(_self.copyWith(editedTask: value));
  });
}
}

// dart format on
