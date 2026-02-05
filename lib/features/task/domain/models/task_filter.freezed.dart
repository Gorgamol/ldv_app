// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFilter {

 List<TaskPriority> get priority; List<TaskStatus> get status; List<Category> get category; String get search;
/// Create a copy of TaskFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFilterCopyWith<TaskFilter> get copyWith => _$TaskFilterCopyWithImpl<TaskFilter>(this as TaskFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFilter&&const DeepCollectionEquality().equals(other.priority, priority)&&const DeepCollectionEquality().equals(other.status, status)&&const DeepCollectionEquality().equals(other.category, category)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(priority),const DeepCollectionEquality().hash(status),const DeepCollectionEquality().hash(category),search);

@override
String toString() {
  return 'TaskFilter(priority: $priority, status: $status, category: $category, search: $search)';
}


}

/// @nodoc
abstract mixin class $TaskFilterCopyWith<$Res>  {
  factory $TaskFilterCopyWith(TaskFilter value, $Res Function(TaskFilter) _then) = _$TaskFilterCopyWithImpl;
@useResult
$Res call({
 List<TaskPriority> priority, List<TaskStatus> status, List<Category> category, String search
});




}
/// @nodoc
class _$TaskFilterCopyWithImpl<$Res>
    implements $TaskFilterCopyWith<$Res> {
  _$TaskFilterCopyWithImpl(this._self, this._then);

  final TaskFilter _self;
  final $Res Function(TaskFilter) _then;

/// Create a copy of TaskFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? priority = null,Object? status = null,Object? category = null,Object? search = null,}) {
  return _then(_self.copyWith(
priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as List<TaskPriority>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as List<TaskStatus>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<Category>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskFilter].
extension TaskFilterPatterns on TaskFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskFilter value)  $default,){
final _that = this;
switch (_that) {
case _TaskFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskFilter value)?  $default,){
final _that = this;
switch (_that) {
case _TaskFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TaskPriority> priority,  List<TaskStatus> status,  List<Category> category,  String search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskFilter() when $default != null:
return $default(_that.priority,_that.status,_that.category,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TaskPriority> priority,  List<TaskStatus> status,  List<Category> category,  String search)  $default,) {final _that = this;
switch (_that) {
case _TaskFilter():
return $default(_that.priority,_that.status,_that.category,_that.search);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TaskPriority> priority,  List<TaskStatus> status,  List<Category> category,  String search)?  $default,) {final _that = this;
switch (_that) {
case _TaskFilter() when $default != null:
return $default(_that.priority,_that.status,_that.category,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class _TaskFilter implements TaskFilter {
  const _TaskFilter({final  List<TaskPriority> priority = const [], final  List<TaskStatus> status = const [], final  List<Category> category = const [], this.search = ''}): _priority = priority,_status = status,_category = category;
  

 final  List<TaskPriority> _priority;
@override@JsonKey() List<TaskPriority> get priority {
  if (_priority is EqualUnmodifiableListView) return _priority;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_priority);
}

 final  List<TaskStatus> _status;
@override@JsonKey() List<TaskStatus> get status {
  if (_status is EqualUnmodifiableListView) return _status;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_status);
}

 final  List<Category> _category;
@override@JsonKey() List<Category> get category {
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_category);
}

@override@JsonKey() final  String search;

/// Create a copy of TaskFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskFilterCopyWith<_TaskFilter> get copyWith => __$TaskFilterCopyWithImpl<_TaskFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskFilter&&const DeepCollectionEquality().equals(other._priority, _priority)&&const DeepCollectionEquality().equals(other._status, _status)&&const DeepCollectionEquality().equals(other._category, _category)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_priority),const DeepCollectionEquality().hash(_status),const DeepCollectionEquality().hash(_category),search);

@override
String toString() {
  return 'TaskFilter(priority: $priority, status: $status, category: $category, search: $search)';
}


}

/// @nodoc
abstract mixin class _$TaskFilterCopyWith<$Res> implements $TaskFilterCopyWith<$Res> {
  factory _$TaskFilterCopyWith(_TaskFilter value, $Res Function(_TaskFilter) _then) = __$TaskFilterCopyWithImpl;
@override @useResult
$Res call({
 List<TaskPriority> priority, List<TaskStatus> status, List<Category> category, String search
});




}
/// @nodoc
class __$TaskFilterCopyWithImpl<$Res>
    implements _$TaskFilterCopyWith<$Res> {
  __$TaskFilterCopyWithImpl(this._self, this._then);

  final _TaskFilter _self;
  final $Res Function(_TaskFilter) _then;

/// Create a copy of TaskFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? priority = null,Object? status = null,Object? category = null,Object? search = null,}) {
  return _then(_TaskFilter(
priority: null == priority ? _self._priority : priority // ignore: cast_nullable_to_non_nullable
as List<TaskPriority>,status: null == status ? _self._status : status // ignore: cast_nullable_to_non_nullable
as List<TaskStatus>,category: null == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<Category>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
