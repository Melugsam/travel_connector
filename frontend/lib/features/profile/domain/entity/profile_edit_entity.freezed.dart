// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEditEntity {
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEditEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEditEntityCopyWith<ProfileEditEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditEntityCopyWith<$Res> {
  factory $ProfileEditEntityCopyWith(
          ProfileEditEntity value, $Res Function(ProfileEditEntity) then) =
      _$ProfileEditEntityCopyWithImpl<$Res, ProfileEditEntity>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProfileEditEntityCopyWithImpl<$Res, $Val extends ProfileEditEntity>
    implements $ProfileEditEntityCopyWith<$Res> {
  _$ProfileEditEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEditEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEditEntityImplCopyWith<$Res>
    implements $ProfileEditEntityCopyWith<$Res> {
  factory _$$ProfileEditEntityImplCopyWith(_$ProfileEditEntityImpl value,
          $Res Function(_$ProfileEditEntityImpl) then) =
      __$$ProfileEditEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProfileEditEntityImplCopyWithImpl<$Res>
    extends _$ProfileEditEntityCopyWithImpl<$Res, _$ProfileEditEntityImpl>
    implements _$$ProfileEditEntityImplCopyWith<$Res> {
  __$$ProfileEditEntityImplCopyWithImpl(_$ProfileEditEntityImpl _value,
      $Res Function(_$ProfileEditEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEditEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProfileEditEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileEditEntityImpl implements _ProfileEditEntity {
  const _$ProfileEditEntityImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileEditEntity(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditEntityImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileEditEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditEntityImplCopyWith<_$ProfileEditEntityImpl> get copyWith =>
      __$$ProfileEditEntityImplCopyWithImpl<_$ProfileEditEntityImpl>(
          this, _$identity);
}

abstract class _ProfileEditEntity implements ProfileEditEntity {
  const factory _ProfileEditEntity({required final String message}) =
      _$ProfileEditEntityImpl;

  @override
  String get message;

  /// Create a copy of ProfileEditEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEditEntityImplCopyWith<_$ProfileEditEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
