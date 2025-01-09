// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostLikeEntity {
  String get message => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  List<int> get likedBy => throw _privateConstructorUsedError;

  /// Create a copy of PostLikeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostLikeEntityCopyWith<PostLikeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLikeEntityCopyWith<$Res> {
  factory $PostLikeEntityCopyWith(
          PostLikeEntity value, $Res Function(PostLikeEntity) then) =
      _$PostLikeEntityCopyWithImpl<$Res, PostLikeEntity>;
  @useResult
  $Res call({String message, int likesCount, List<int> likedBy});
}

/// @nodoc
class _$PostLikeEntityCopyWithImpl<$Res, $Val extends PostLikeEntity>
    implements $PostLikeEntityCopyWith<$Res> {
  _$PostLikeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostLikeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? likesCount = null,
    Object? likedBy = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostLikeEntityImplCopyWith<$Res>
    implements $PostLikeEntityCopyWith<$Res> {
  factory _$$PostLikeEntityImplCopyWith(_$PostLikeEntityImpl value,
          $Res Function(_$PostLikeEntityImpl) then) =
      __$$PostLikeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int likesCount, List<int> likedBy});
}

/// @nodoc
class __$$PostLikeEntityImplCopyWithImpl<$Res>
    extends _$PostLikeEntityCopyWithImpl<$Res, _$PostLikeEntityImpl>
    implements _$$PostLikeEntityImplCopyWith<$Res> {
  __$$PostLikeEntityImplCopyWithImpl(
      _$PostLikeEntityImpl _value, $Res Function(_$PostLikeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostLikeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? likesCount = null,
    Object? likedBy = null,
  }) {
    return _then(_$PostLikeEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: null == likedBy
          ? _value._likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$PostLikeEntityImpl implements _PostLikeEntity {
  const _$PostLikeEntityImpl(
      {required this.message,
      required this.likesCount,
      required final List<int> likedBy})
      : _likedBy = likedBy;

  @override
  final String message;
  @override
  final int likesCount;
  final List<int> _likedBy;
  @override
  List<int> get likedBy {
    if (_likedBy is EqualUnmodifiableListView) return _likedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedBy);
  }

  @override
  String toString() {
    return 'PostLikeEntity(message: $message, likesCount: $likesCount, likedBy: $likedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLikeEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            const DeepCollectionEquality().equals(other._likedBy, _likedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, likesCount,
      const DeepCollectionEquality().hash(_likedBy));

  /// Create a copy of PostLikeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLikeEntityImplCopyWith<_$PostLikeEntityImpl> get copyWith =>
      __$$PostLikeEntityImplCopyWithImpl<_$PostLikeEntityImpl>(
          this, _$identity);
}

abstract class _PostLikeEntity implements PostLikeEntity {
  const factory _PostLikeEntity(
      {required final String message,
      required final int likesCount,
      required final List<int> likedBy}) = _$PostLikeEntityImpl;

  @override
  String get message;
  @override
  int get likesCount;
  @override
  List<int> get likedBy;

  /// Create a copy of PostLikeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostLikeEntityImplCopyWith<_$PostLikeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
