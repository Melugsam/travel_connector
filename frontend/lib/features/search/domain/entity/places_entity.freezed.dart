// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlacesEntity {
  List<PlaceEntity> get places => throw _privateConstructorUsedError;

  /// Create a copy of PlacesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacesEntityCopyWith<PlacesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesEntityCopyWith<$Res> {
  factory $PlacesEntityCopyWith(
          PlacesEntity value, $Res Function(PlacesEntity) then) =
      _$PlacesEntityCopyWithImpl<$Res, PlacesEntity>;
  @useResult
  $Res call({List<PlaceEntity> places});
}

/// @nodoc
class _$PlacesEntityCopyWithImpl<$Res, $Val extends PlacesEntity>
    implements $PlacesEntityCopyWith<$Res> {
  _$PlacesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlacesEntityImplCopyWith<$Res>
    implements $PlacesEntityCopyWith<$Res> {
  factory _$$PlacesEntityImplCopyWith(
          _$PlacesEntityImpl value, $Res Function(_$PlacesEntityImpl) then) =
      __$$PlacesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlaceEntity> places});
}

/// @nodoc
class __$$PlacesEntityImplCopyWithImpl<$Res>
    extends _$PlacesEntityCopyWithImpl<$Res, _$PlacesEntityImpl>
    implements _$$PlacesEntityImplCopyWith<$Res> {
  __$$PlacesEntityImplCopyWithImpl(
      _$PlacesEntityImpl _value, $Res Function(_$PlacesEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlacesEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_$PlacesEntityImpl(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceEntity>,
    ));
  }
}

/// @nodoc

class _$PlacesEntityImpl implements _PlacesEntity {
  const _$PlacesEntityImpl({required final List<PlaceEntity> places})
      : _places = places;

  final List<PlaceEntity> _places;
  @override
  List<PlaceEntity> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'PlacesEntity(places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesEntityImpl &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_places));

  /// Create a copy of PlacesEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesEntityImplCopyWith<_$PlacesEntityImpl> get copyWith =>
      __$$PlacesEntityImplCopyWithImpl<_$PlacesEntityImpl>(this, _$identity);
}

abstract class _PlacesEntity implements PlacesEntity {
  const factory _PlacesEntity({required final List<PlaceEntity> places}) =
      _$PlacesEntityImpl;

  @override
  List<PlaceEntity> get places;

  /// Create a copy of PlacesEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacesEntityImplCopyWith<_$PlacesEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaceEntity {
  String get name => throw _privateConstructorUsedError;
  String get vicinity => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get userRatingsTotal => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  bool get isOpenNow => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Create a copy of PlaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceEntityCopyWith<PlaceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceEntityCopyWith<$Res> {
  factory $PlaceEntityCopyWith(
          PlaceEntity value, $Res Function(PlaceEntity) then) =
      _$PlaceEntityCopyWithImpl<$Res, PlaceEntity>;
  @useResult
  $Res call(
      {String name,
      String vicinity,
      double? rating,
      int? userRatingsTotal,
      String icon,
      bool isOpenNow,
      double latitude,
      double longitude});
}

/// @nodoc
class _$PlaceEntityCopyWithImpl<$Res, $Val extends PlaceEntity>
    implements $PlaceEntityCopyWith<$Res> {
  _$PlaceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vicinity = null,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? icon = null,
    Object? isOpenNow = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenNow: null == isOpenNow
          ? _value.isOpenNow
          : isOpenNow // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceEntityImplCopyWith<$Res>
    implements $PlaceEntityCopyWith<$Res> {
  factory _$$PlaceEntityImplCopyWith(
          _$PlaceEntityImpl value, $Res Function(_$PlaceEntityImpl) then) =
      __$$PlaceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String vicinity,
      double? rating,
      int? userRatingsTotal,
      String icon,
      bool isOpenNow,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$PlaceEntityImplCopyWithImpl<$Res>
    extends _$PlaceEntityCopyWithImpl<$Res, _$PlaceEntityImpl>
    implements _$$PlaceEntityImplCopyWith<$Res> {
  __$$PlaceEntityImplCopyWithImpl(
      _$PlaceEntityImpl _value, $Res Function(_$PlaceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? vicinity = null,
    Object? rating = freezed,
    Object? userRatingsTotal = freezed,
    Object? icon = null,
    Object? isOpenNow = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$PlaceEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      userRatingsTotal: freezed == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isOpenNow: null == isOpenNow
          ? _value.isOpenNow
          : isOpenNow // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PlaceEntityImpl implements _PlaceEntity {
  const _$PlaceEntityImpl(
      {required this.name,
      required this.vicinity,
      required this.rating,
      required this.userRatingsTotal,
      required this.icon,
      required this.isOpenNow,
      required this.latitude,
      required this.longitude});

  @override
  final String name;
  @override
  final String vicinity;
  @override
  final double? rating;
  @override
  final int? userRatingsTotal;
  @override
  final String icon;
  @override
  final bool isOpenNow;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'PlaceEntity(name: $name, vicinity: $vicinity, rating: $rating, userRatingsTotal: $userRatingsTotal, icon: $icon, isOpenNow: $isOpenNow, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isOpenNow, isOpenNow) ||
                other.isOpenNow == isOpenNow) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, vicinity, rating,
      userRatingsTotal, icon, isOpenNow, latitude, longitude);

  /// Create a copy of PlaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceEntityImplCopyWith<_$PlaceEntityImpl> get copyWith =>
      __$$PlaceEntityImplCopyWithImpl<_$PlaceEntityImpl>(this, _$identity);
}

abstract class _PlaceEntity implements PlaceEntity {
  const factory _PlaceEntity(
      {required final String name,
      required final String vicinity,
      required final double? rating,
      required final int? userRatingsTotal,
      required final String icon,
      required final bool isOpenNow,
      required final double latitude,
      required final double longitude}) = _$PlaceEntityImpl;

  @override
  String get name;
  @override
  String get vicinity;
  @override
  double? get rating;
  @override
  int? get userRatingsTotal;
  @override
  String get icon;
  @override
  bool get isOpenNow;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of PlaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceEntityImplCopyWith<_$PlaceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
