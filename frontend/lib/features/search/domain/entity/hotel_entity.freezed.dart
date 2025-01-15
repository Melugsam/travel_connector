// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HotelEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get primaryInfo => throw _privateConstructorUsedError;
  String get secondaryInfo => throw _privateConstructorUsedError;
  BubbleRatingEntity get bubbleRating => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelEntityCopyWith<HotelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelEntityCopyWith<$Res> {
  factory $HotelEntityCopyWith(
          HotelEntity value, $Res Function(HotelEntity) then) =
      _$HotelEntityCopyWithImpl<$Res, HotelEntity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? primaryInfo,
      String secondaryInfo,
      BubbleRatingEntity bubbleRating,
      List<String> photos});

  $BubbleRatingEntityCopyWith<$Res> get bubbleRating;
}

/// @nodoc
class _$HotelEntityCopyWithImpl<$Res, $Val extends HotelEntity>
    implements $HotelEntityCopyWith<$Res> {
  _$HotelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? primaryInfo = freezed,
    Object? secondaryInfo = null,
    Object? bubbleRating = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      primaryInfo: freezed == primaryInfo
          ? _value.primaryInfo
          : primaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryInfo: null == secondaryInfo
          ? _value.secondaryInfo
          : secondaryInfo // ignore: cast_nullable_to_non_nullable
              as String,
      bubbleRating: null == bubbleRating
          ? _value.bubbleRating
          : bubbleRating // ignore: cast_nullable_to_non_nullable
              as BubbleRatingEntity,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BubbleRatingEntityCopyWith<$Res> get bubbleRating {
    return $BubbleRatingEntityCopyWith<$Res>(_value.bubbleRating, (value) {
      return _then(_value.copyWith(bubbleRating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HotelEntityImplCopyWith<$Res>
    implements $HotelEntityCopyWith<$Res> {
  factory _$$HotelEntityImplCopyWith(
          _$HotelEntityImpl value, $Res Function(_$HotelEntityImpl) then) =
      __$$HotelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? primaryInfo,
      String secondaryInfo,
      BubbleRatingEntity bubbleRating,
      List<String> photos});

  @override
  $BubbleRatingEntityCopyWith<$Res> get bubbleRating;
}

/// @nodoc
class __$$HotelEntityImplCopyWithImpl<$Res>
    extends _$HotelEntityCopyWithImpl<$Res, _$HotelEntityImpl>
    implements _$$HotelEntityImplCopyWith<$Res> {
  __$$HotelEntityImplCopyWithImpl(
      _$HotelEntityImpl _value, $Res Function(_$HotelEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? primaryInfo = freezed,
    Object? secondaryInfo = null,
    Object? bubbleRating = null,
    Object? photos = null,
  }) {
    return _then(_$HotelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      primaryInfo: freezed == primaryInfo
          ? _value.primaryInfo
          : primaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryInfo: null == secondaryInfo
          ? _value.secondaryInfo
          : secondaryInfo // ignore: cast_nullable_to_non_nullable
              as String,
      bubbleRating: null == bubbleRating
          ? _value.bubbleRating
          : bubbleRating // ignore: cast_nullable_to_non_nullable
              as BubbleRatingEntity,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$HotelEntityImpl implements _HotelEntity {
  const _$HotelEntityImpl(
      {required this.id,
      required this.title,
      this.primaryInfo,
      required this.secondaryInfo,
      required this.bubbleRating,
      required final List<String> photos})
      : _photos = photos;

  @override
  final String id;
  @override
  final String title;
  @override
  final String? primaryInfo;
  @override
  final String secondaryInfo;
  @override
  final BubbleRatingEntity bubbleRating;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'HotelEntity(id: $id, title: $title, primaryInfo: $primaryInfo, secondaryInfo: $secondaryInfo, bubbleRating: $bubbleRating, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.primaryInfo, primaryInfo) ||
                other.primaryInfo == primaryInfo) &&
            (identical(other.secondaryInfo, secondaryInfo) ||
                other.secondaryInfo == secondaryInfo) &&
            (identical(other.bubbleRating, bubbleRating) ||
                other.bubbleRating == bubbleRating) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      primaryInfo,
      secondaryInfo,
      bubbleRating,
      const DeepCollectionEquality().hash(_photos));

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelEntityImplCopyWith<_$HotelEntityImpl> get copyWith =>
      __$$HotelEntityImplCopyWithImpl<_$HotelEntityImpl>(this, _$identity);
}

abstract class _HotelEntity implements HotelEntity {
  const factory _HotelEntity(
      {required final String id,
      required final String title,
      final String? primaryInfo,
      required final String secondaryInfo,
      required final BubbleRatingEntity bubbleRating,
      required final List<String> photos}) = _$HotelEntityImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get primaryInfo;
  @override
  String get secondaryInfo;
  @override
  BubbleRatingEntity get bubbleRating;
  @override
  List<String> get photos;

  /// Create a copy of HotelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelEntityImplCopyWith<_$HotelEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BubbleRatingEntity {
  String get count => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Create a copy of BubbleRatingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BubbleRatingEntityCopyWith<BubbleRatingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BubbleRatingEntityCopyWith<$Res> {
  factory $BubbleRatingEntityCopyWith(
          BubbleRatingEntity value, $Res Function(BubbleRatingEntity) then) =
      _$BubbleRatingEntityCopyWithImpl<$Res, BubbleRatingEntity>;
  @useResult
  $Res call({String count, double rating});
}

/// @nodoc
class _$BubbleRatingEntityCopyWithImpl<$Res, $Val extends BubbleRatingEntity>
    implements $BubbleRatingEntityCopyWith<$Res> {
  _$BubbleRatingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BubbleRatingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BubbleRatingEntityImplCopyWith<$Res>
    implements $BubbleRatingEntityCopyWith<$Res> {
  factory _$$BubbleRatingEntityImplCopyWith(_$BubbleRatingEntityImpl value,
          $Res Function(_$BubbleRatingEntityImpl) then) =
      __$$BubbleRatingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String count, double rating});
}

/// @nodoc
class __$$BubbleRatingEntityImplCopyWithImpl<$Res>
    extends _$BubbleRatingEntityCopyWithImpl<$Res, _$BubbleRatingEntityImpl>
    implements _$$BubbleRatingEntityImplCopyWith<$Res> {
  __$$BubbleRatingEntityImplCopyWithImpl(_$BubbleRatingEntityImpl _value,
      $Res Function(_$BubbleRatingEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BubbleRatingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? rating = null,
  }) {
    return _then(_$BubbleRatingEntityImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BubbleRatingEntityImpl implements _BubbleRatingEntity {
  const _$BubbleRatingEntityImpl({required this.count, required this.rating});

  @override
  final String count;
  @override
  final double rating;

  @override
  String toString() {
    return 'BubbleRatingEntity(count: $count, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BubbleRatingEntityImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, rating);

  /// Create a copy of BubbleRatingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BubbleRatingEntityImplCopyWith<_$BubbleRatingEntityImpl> get copyWith =>
      __$$BubbleRatingEntityImplCopyWithImpl<_$BubbleRatingEntityImpl>(
          this, _$identity);
}

abstract class _BubbleRatingEntity implements BubbleRatingEntity {
  const factory _BubbleRatingEntity(
      {required final String count,
      required final double rating}) = _$BubbleRatingEntityImpl;

  @override
  String get count;
  @override
  double get rating;

  /// Create a copy of BubbleRatingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BubbleRatingEntityImplCopyWith<_$BubbleRatingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
