// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherEntity {
  String get cityName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  List<WeatherDetailEntity> get weatherDetails =>
      throw _privateConstructorUsedError;

  /// Create a copy of WeatherEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherEntityCopyWith<WeatherEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEntityCopyWith<$Res> {
  factory $WeatherEntityCopyWith(
          WeatherEntity value, $Res Function(WeatherEntity) then) =
      _$WeatherEntityCopyWithImpl<$Res, WeatherEntity>;
  @useResult
  $Res call(
      {String cityName,
      String country,
      List<WeatherDetailEntity> weatherDetails});
}

/// @nodoc
class _$WeatherEntityCopyWithImpl<$Res, $Val extends WeatherEntity>
    implements $WeatherEntityCopyWith<$Res> {
  _$WeatherEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? country = null,
    Object? weatherDetails = null,
  }) {
    return _then(_value.copyWith(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDetails: null == weatherDetails
          ? _value.weatherDetails
          : weatherDetails // ignore: cast_nullable_to_non_nullable
              as List<WeatherDetailEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherEntityImplCopyWith<$Res>
    implements $WeatherEntityCopyWith<$Res> {
  factory _$$WeatherEntityImplCopyWith(
          _$WeatherEntityImpl value, $Res Function(_$WeatherEntityImpl) then) =
      __$$WeatherEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cityName,
      String country,
      List<WeatherDetailEntity> weatherDetails});
}

/// @nodoc
class __$$WeatherEntityImplCopyWithImpl<$Res>
    extends _$WeatherEntityCopyWithImpl<$Res, _$WeatherEntityImpl>
    implements _$$WeatherEntityImplCopyWith<$Res> {
  __$$WeatherEntityImplCopyWithImpl(
      _$WeatherEntityImpl _value, $Res Function(_$WeatherEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = null,
    Object? country = null,
    Object? weatherDetails = null,
  }) {
    return _then(_$WeatherEntityImpl(
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      weatherDetails: null == weatherDetails
          ? _value._weatherDetails
          : weatherDetails // ignore: cast_nullable_to_non_nullable
              as List<WeatherDetailEntity>,
    ));
  }
}

/// @nodoc

class _$WeatherEntityImpl implements _WeatherEntity {
  const _$WeatherEntityImpl(
      {required this.cityName,
      required this.country,
      required final List<WeatherDetailEntity> weatherDetails})
      : _weatherDetails = weatherDetails;

  @override
  final String cityName;
  @override
  final String country;
  final List<WeatherDetailEntity> _weatherDetails;
  @override
  List<WeatherDetailEntity> get weatherDetails {
    if (_weatherDetails is EqualUnmodifiableListView) return _weatherDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherDetails);
  }

  @override
  String toString() {
    return 'WeatherEntity(cityName: $cityName, country: $country, weatherDetails: $weatherDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherEntityImpl &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.country, country) || other.country == country) &&
            const DeepCollectionEquality()
                .equals(other._weatherDetails, _weatherDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityName, country,
      const DeepCollectionEquality().hash(_weatherDetails));

  /// Create a copy of WeatherEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherEntityImplCopyWith<_$WeatherEntityImpl> get copyWith =>
      __$$WeatherEntityImplCopyWithImpl<_$WeatherEntityImpl>(this, _$identity);
}

abstract class _WeatherEntity implements WeatherEntity {
  const factory _WeatherEntity(
          {required final String cityName,
          required final String country,
          required final List<WeatherDetailEntity> weatherDetails}) =
      _$WeatherEntityImpl;

  @override
  String get cityName;
  @override
  String get country;
  @override
  List<WeatherDetailEntity> get weatherDetails;

  /// Create a copy of WeatherEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherEntityImplCopyWith<_$WeatherEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeatherDetailEntity {
  DateTime get dateTime => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Create a copy of WeatherDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDetailEntityCopyWith<WeatherDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDetailEntityCopyWith<$Res> {
  factory $WeatherDetailEntityCopyWith(
          WeatherDetailEntity value, $Res Function(WeatherDetailEntity) then) =
      _$WeatherDetailEntityCopyWithImpl<$Res, WeatherDetailEntity>;
  @useResult
  $Res call(
      {DateTime dateTime, double temperature, String description, String icon});
}

/// @nodoc
class _$WeatherDetailEntityCopyWithImpl<$Res, $Val extends WeatherDetailEntity>
    implements $WeatherDetailEntityCopyWith<$Res> {
  _$WeatherDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? temperature = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDetailEntityImplCopyWith<$Res>
    implements $WeatherDetailEntityCopyWith<$Res> {
  factory _$$WeatherDetailEntityImplCopyWith(_$WeatherDetailEntityImpl value,
          $Res Function(_$WeatherDetailEntityImpl) then) =
      __$$WeatherDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime dateTime, double temperature, String description, String icon});
}

/// @nodoc
class __$$WeatherDetailEntityImplCopyWithImpl<$Res>
    extends _$WeatherDetailEntityCopyWithImpl<$Res, _$WeatherDetailEntityImpl>
    implements _$$WeatherDetailEntityImplCopyWith<$Res> {
  __$$WeatherDetailEntityImplCopyWithImpl(_$WeatherDetailEntityImpl _value,
      $Res Function(_$WeatherDetailEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? temperature = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$WeatherDetailEntityImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherDetailEntityImpl implements _WeatherDetailEntity {
  const _$WeatherDetailEntityImpl(
      {required this.dateTime,
      required this.temperature,
      required this.description,
      required this.icon});

  @override
  final DateTime dateTime;
  @override
  final double temperature;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherDetailEntity(dateTime: $dateTime, temperature: $temperature, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDetailEntityImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, dateTime, temperature, description, icon);

  /// Create a copy of WeatherDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDetailEntityImplCopyWith<_$WeatherDetailEntityImpl> get copyWith =>
      __$$WeatherDetailEntityImplCopyWithImpl<_$WeatherDetailEntityImpl>(
          this, _$identity);
}

abstract class _WeatherDetailEntity implements WeatherDetailEntity {
  const factory _WeatherDetailEntity(
      {required final DateTime dateTime,
      required final double temperature,
      required final String description,
      required final String icon}) = _$WeatherDetailEntityImpl;

  @override
  DateTime get dateTime;
  @override
  double get temperature;
  @override
  String get description;
  @override
  String get icon;

  /// Create a copy of WeatherDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDetailEntityImplCopyWith<_$WeatherDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
