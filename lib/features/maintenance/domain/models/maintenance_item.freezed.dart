// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceItem {

 String get id; DateTime? get createdAt; DateTime? get updatedAt; String get title; String get description; String get author; MaintenanceImage? get thumbnail; List<MaintenanceImage> get images; List<MaintenanceUpdate> get updates;
/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceItemCopyWith<MaintenanceItem> get copyWith => _$MaintenanceItemCopyWithImpl<MaintenanceItem>(this as MaintenanceItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.updates, updates));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,title,description,author,thumbnail,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(updates));

@override
String toString() {
  return 'MaintenanceItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, author: $author, thumbnail: $thumbnail, images: $images, updates: $updates)';
}


}

/// @nodoc
abstract mixin class $MaintenanceItemCopyWith<$Res>  {
  factory $MaintenanceItemCopyWith(MaintenanceItem value, $Res Function(MaintenanceItem) _then) = _$MaintenanceItemCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? createdAt, DateTime? updatedAt, String title, String description, String author, MaintenanceImage? thumbnail, List<MaintenanceImage> images, List<MaintenanceUpdate> updates
});


$MaintenanceImageCopyWith<$Res>? get thumbnail;

}
/// @nodoc
class _$MaintenanceItemCopyWithImpl<$Res>
    implements $MaintenanceItemCopyWith<$Res> {
  _$MaintenanceItemCopyWithImpl(this._self, this._then);

  final MaintenanceItem _self;
  final $Res Function(MaintenanceItem) _then;

/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? title = null,Object? description = null,Object? author = null,Object? thumbnail = freezed,Object? images = null,Object? updates = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MaintenanceImage?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<MaintenanceImage>,updates: null == updates ? _self.updates : updates // ignore: cast_nullable_to_non_nullable
as List<MaintenanceUpdate>,
  ));
}
/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceImageCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MaintenanceImageCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceItem].
extension MaintenanceItemPatterns on MaintenanceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceItem value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceItem value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime? createdAt,  DateTime? updatedAt,  String title,  String description,  String author,  MaintenanceImage? thumbnail,  List<MaintenanceImage> images,  List<MaintenanceUpdate> updates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.title,_that.description,_that.author,_that.thumbnail,_that.images,_that.updates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime? createdAt,  DateTime? updatedAt,  String title,  String description,  String author,  MaintenanceImage? thumbnail,  List<MaintenanceImage> images,  List<MaintenanceUpdate> updates)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceItem():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.title,_that.description,_that.author,_that.thumbnail,_that.images,_that.updates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime? createdAt,  DateTime? updatedAt,  String title,  String description,  String author,  MaintenanceImage? thumbnail,  List<MaintenanceImage> images,  List<MaintenanceUpdate> updates)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.title,_that.description,_that.author,_that.thumbnail,_that.images,_that.updates);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceItem implements MaintenanceItem {
  const _MaintenanceItem({this.id = '', this.createdAt = null, this.updatedAt = null, this.title = '', this.description = '', this.author = '', this.thumbnail = null, final  List<MaintenanceImage> images = const [], final  List<MaintenanceUpdate> updates = const []}): _images = images,_updates = updates;
  

@override@JsonKey() final  String id;
@override@JsonKey() final  DateTime? createdAt;
@override@JsonKey() final  DateTime? updatedAt;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String author;
@override@JsonKey() final  MaintenanceImage? thumbnail;
 final  List<MaintenanceImage> _images;
@override@JsonKey() List<MaintenanceImage> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<MaintenanceUpdate> _updates;
@override@JsonKey() List<MaintenanceUpdate> get updates {
  if (_updates is EqualUnmodifiableListView) return _updates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_updates);
}


/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceItemCopyWith<_MaintenanceItem> get copyWith => __$MaintenanceItemCopyWithImpl<_MaintenanceItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.author, author) || other.author == author)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._updates, _updates));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,title,description,author,thumbnail,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_updates));

@override
String toString() {
  return 'MaintenanceItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, author: $author, thumbnail: $thumbnail, images: $images, updates: $updates)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceItemCopyWith<$Res> implements $MaintenanceItemCopyWith<$Res> {
  factory _$MaintenanceItemCopyWith(_MaintenanceItem value, $Res Function(_MaintenanceItem) _then) = __$MaintenanceItemCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? createdAt, DateTime? updatedAt, String title, String description, String author, MaintenanceImage? thumbnail, List<MaintenanceImage> images, List<MaintenanceUpdate> updates
});


@override $MaintenanceImageCopyWith<$Res>? get thumbnail;

}
/// @nodoc
class __$MaintenanceItemCopyWithImpl<$Res>
    implements _$MaintenanceItemCopyWith<$Res> {
  __$MaintenanceItemCopyWithImpl(this._self, this._then);

  final _MaintenanceItem _self;
  final $Res Function(_MaintenanceItem) _then;

/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? title = null,Object? description = null,Object? author = null,Object? thumbnail = freezed,Object? images = null,Object? updates = null,}) {
  return _then(_MaintenanceItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as MaintenanceImage?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<MaintenanceImage>,updates: null == updates ? _self._updates : updates // ignore: cast_nullable_to_non_nullable
as List<MaintenanceUpdate>,
  ));
}

/// Create a copy of MaintenanceItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceImageCopyWith<$Res>? get thumbnail {
    if (_self.thumbnail == null) {
    return null;
  }

  return $MaintenanceImageCopyWith<$Res>(_self.thumbnail!, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}

// dart format on
