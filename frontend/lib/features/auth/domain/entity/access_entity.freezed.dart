// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccessEntity {
  String get accessToken => throw _privateConstructorUsedError;

  /// Create a copy of AccessEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessEntityCopyWith<AccessEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessEntityCopyWith<$Res> {
  factory $AccessEntityCopyWith(
          AccessEntity value, $Res Function(AccessEntity) then) =
      _$AccessEntityCopyWithImpl<$Res, AccessEntity>;
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class _$AccessEntityCopyWithImpl<$Res, $Val extends AccessEntity>
    implements $AccessEntityCopyWith<$Res> {
  _$AccessEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessEntityImplCopyWith<$Res>
    implements $AccessEntityCopyWith<$Res> {
  factory _$$AccessEntityImplCopyWith(
          _$AccessEntityImpl value, $Res Function(_$AccessEntityImpl) then) =
      __$$AccessEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken});
}

/// @nodoc
class __$$AccessEntityImplCopyWithImpl<$Res>
    extends _$AccessEntityCopyWithImpl<$Res, _$AccessEntityImpl>
    implements _$$AccessEntityImplCopyWith<$Res> {
  __$$AccessEntityImplCopyWithImpl(
      _$AccessEntityImpl _value, $Res Function(_$AccessEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccessEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$AccessEntityImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccessEntityImpl implements _AccessEntity {
  const _$AccessEntityImpl({required this.accessToken});

  @override
  final String accessToken;

  @override
  String toString() {
    return 'AccessEntity(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessEntityImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of AccessEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessEntityImplCopyWith<_$AccessEntityImpl> get copyWith =>
      __$$AccessEntityImplCopyWithImpl<_$AccessEntityImpl>(this, _$identity);
}

abstract class _AccessEntity implements AccessEntity {
  const factory _AccessEntity({required final String accessToken}) =
      _$AccessEntityImpl;

  @override
  String get accessToken;

  /// Create a copy of AccessEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessEntityImplCopyWith<_$AccessEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
