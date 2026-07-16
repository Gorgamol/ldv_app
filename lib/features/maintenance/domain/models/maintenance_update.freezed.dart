// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceUpdate {

 DateTime? get createdAt; String get description; String get author; List<MaintenanceImage> get images;
/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceUpdateCopyWith<MaintenanceUpdate> get copyWith => _$MaintenanceUpdateCopyWithImpl<MaintenanceUpdate>(this as MaintenanceUpdate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceUpdate&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,description,author,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'MaintenanceUpdate(createdAt: $createdAt, description: $description, author: $author, images: $images)';
}


}

/// @nodoc
abstract mixin class $MaintenanceUpdateCopyWith<$Res>  {
  factory $MaintenanceUpdateCopyWith(MaintenanceUpdate value, $Res Function(MaintenanceUpdate) _then) = _$MaintenanceUpdateCopyWithImpl;
@useResult
$Res call({
 DateTime? createdAt, String description, String author, List<MaintenanceImage> images
});




}
/// @nodoc
class _$MaintenanceUpdateCopyWithImpl<$Res>
    implements $MaintenanceUpdateCopyWith<$Res> {
  _$MaintenanceUpdateCopyWithImpl(this._self, this._then);

  final MaintenanceUpdate _self;
  final $Res Function(MaintenanceUpdate) _then;

/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? description = null,Object? author = null,Object? images = null,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MaintenanceImage>,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceUpdate].
extension MaintenanceUpdatePatterns on MaintenanceUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceUpdate value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? createdAt,  String description,  String author,  List<MaintenanceImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
return $default(_that.createdAt,_that.description,_that.author,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? createdAt,  String description,  String author,  List<MaintenanceImage> images)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdate():
return $default(_that.createdAt,_that.description,_that.author,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? createdAt,  String description,  String author,  List<MaintenanceImage> images)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdate() when $default != null:
return $default(_that.createdAt,_that.description,_that.author,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceUpdate implements MaintenanceUpdate {
  const _MaintenanceUpdate({this.createdAt = null, this.description = '', this.author = '', final  List<MaintenanceImage> images = const []}): _images = images;
  

@override@JsonKey() final  DateTime? createdAt;
@override@JsonKey() final  String description;
@override@JsonKey() final  String author;
 final  List<MaintenanceImage> _images;
@override@JsonKey() List<MaintenanceImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceUpdateCopyWith<_MaintenanceUpdate> get copyWith => __$MaintenanceUpdateCopyWithImpl<_MaintenanceUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceUpdate&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,description,author,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'MaintenanceUpdate(createdAt: $createdAt, description: $description, author: $author, images: $images)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceUpdateCopyWith<$Res> implements $MaintenanceUpdateCopyWith<$Res> {
  factory _$MaintenanceUpdateCopyWith(_MaintenanceUpdate value, $Res Function(_MaintenanceUpdate) _then) = __$MaintenanceUpdateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? createdAt, String description, String author, List<MaintenanceImage> images
});




}
/// @nodoc
class __$MaintenanceUpdateCopyWithImpl<$Res>
    implements _$MaintenanceUpdateCopyWith<$Res> {
  __$MaintenanceUpdateCopyWithImpl(this._self, this._then);

  final _MaintenanceUpdate _self;
  final $Res Function(_MaintenanceUpdate) _then;

/// Create a copy of MaintenanceUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? description = null,Object? author = null,Object? images = null,}) {
  return _then(_MaintenanceUpdate(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MaintenanceImage>,
  ));
}


}

// dart format on
