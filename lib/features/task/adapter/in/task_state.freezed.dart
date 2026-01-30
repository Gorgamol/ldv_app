// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskState {

 BaseStatus get status; List<Task> get tasks; List<Task> get filteredTasks; TaskFilter get filter; String? get error;
/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskStateCopyWith<TaskState> get copyWith => _$TaskStateCopyWithImpl<TaskState>(this as TaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tasks, tasks)&&const DeepCollectionEquality().equals(other.filteredTasks, filteredTasks)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(tasks),const DeepCollectionEquality().hash(filteredTasks),filter,error);

@override
String toString() {
  return 'TaskState(status: $status, tasks: $tasks, filteredTasks: $filteredTasks, filter: $filter, error: $error)';
}


}

/// @nodoc
abstract mixin class $TaskStateCopyWith<$Res>  {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) _then) = _$TaskStateCopyWithImpl;
@useResult
$Res call({
 BaseStatus status, List<Task> tasks, List<Task> filteredTasks, TaskFilter filter, String? error
});


$TaskFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$TaskStateCopyWithImpl<$Res>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._self, this._then);

  final TaskState _self;
  final $Res Function(TaskState) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? tasks = null,Object? filteredTasks = null,Object? filter = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,filteredTasks: null == filteredTasks ? _self.filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TaskFilter,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskFilterCopyWith<$Res> get filter {
  
  return $TaskFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskState].
extension TaskStatePatterns on TaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskState value)  $default,){
final _that = this;
switch (_that) {
case _TaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseStatus status,  List<Task> tasks,  List<Task> filteredTasks,  TaskFilter filter,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskState() when $default != null:
return $default(_that.status,_that.tasks,_that.filteredTasks,_that.filter,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseStatus status,  List<Task> tasks,  List<Task> filteredTasks,  TaskFilter filter,  String? error)  $default,) {final _that = this;
switch (_that) {
case _TaskState():
return $default(_that.status,_that.tasks,_that.filteredTasks,_that.filter,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseStatus status,  List<Task> tasks,  List<Task> filteredTasks,  TaskFilter filter,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _TaskState() when $default != null:
return $default(_that.status,_that.tasks,_that.filteredTasks,_that.filter,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TaskState implements TaskState {
  const _TaskState({this.status = BaseStatus.init, final  List<Task> tasks = const [], final  List<Task> filteredTasks = const [], this.filter = const TaskFilter(), this.error}): _tasks = tasks,_filteredTasks = filteredTasks;
  

@override@JsonKey() final  BaseStatus status;
 final  List<Task> _tasks;
@override@JsonKey() List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

 final  List<Task> _filteredTasks;
@override@JsonKey() List<Task> get filteredTasks {
  if (_filteredTasks is EqualUnmodifiableListView) return _filteredTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTasks);
}

@override@JsonKey() final  TaskFilter filter;
@override final  String? error;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskStateCopyWith<_TaskState> get copyWith => __$TaskStateCopyWithImpl<_TaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._filteredTasks, _filteredTasks)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_filteredTasks),filter,error);

@override
String toString() {
  return 'TaskState(status: $status, tasks: $tasks, filteredTasks: $filteredTasks, filter: $filter, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TaskStateCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory _$TaskStateCopyWith(_TaskState value, $Res Function(_TaskState) _then) = __$TaskStateCopyWithImpl;
@override @useResult
$Res call({
 BaseStatus status, List<Task> tasks, List<Task> filteredTasks, TaskFilter filter, String? error
});


@override $TaskFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$TaskStateCopyWithImpl<$Res>
    implements _$TaskStateCopyWith<$Res> {
  __$TaskStateCopyWithImpl(this._self, this._then);

  final _TaskState _self;
  final $Res Function(_TaskState) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? tasks = null,Object? filteredTasks = null,Object? filter = null,Object? error = freezed,}) {
  return _then(_TaskState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseStatus,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,filteredTasks: null == filteredTasks ? _self._filteredTasks : filteredTasks // ignore: cast_nullable_to_non_nullable
as List<Task>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TaskFilter,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskFilterCopyWith<$Res> get filter {
  
  return $TaskFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
