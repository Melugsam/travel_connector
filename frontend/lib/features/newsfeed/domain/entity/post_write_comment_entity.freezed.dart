// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_write_comment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostWritePostCommentEntity {
  String get message => throw _privateConstructorUsedError;
  int get commentId => throw _privateConstructorUsedError;

  /// Create a copy of PostWritePostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostWritePostCommentEntityCopyWith<PostWritePostCommentEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostWritePostCommentEntityCopyWith<$Res> {
  factory $PostWritePostCommentEntityCopyWith(PostWritePostCommentEntity value,
          $Res Function(PostWritePostCommentEntity) then) =
      _$PostWritePostCommentEntityCopyWithImpl<$Res,
          PostWritePostCommentEntity>;
  @useResult
  $Res call({String message, int commentId});
}

/// @nodoc
class _$PostWritePostCommentEntityCopyWithImpl<$Res,
        $Val extends PostWritePostCommentEntity>
    implements $PostWritePostCommentEntityCopyWith<$Res> {
  _$PostWritePostCommentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostWritePostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? commentId = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostWritePostCommentEntityImplCopyWith<$Res>
    implements $PostWritePostCommentEntityCopyWith<$Res> {
  factory _$$PostWritePostCommentEntityImplCopyWith(
          _$PostWritePostCommentEntityImpl value,
          $Res Function(_$PostWritePostCommentEntityImpl) then) =
      __$$PostWritePostCommentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int commentId});
}

/// @nodoc
class __$$PostWritePostCommentEntityImplCopyWithImpl<$Res>
    extends _$PostWritePostCommentEntityCopyWithImpl<$Res,
        _$PostWritePostCommentEntityImpl>
    implements _$$PostWritePostCommentEntityImplCopyWith<$Res> {
  __$$PostWritePostCommentEntityImplCopyWithImpl(
      _$PostWritePostCommentEntityImpl _value,
      $Res Function(_$PostWritePostCommentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostWritePostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? commentId = null,
  }) {
    return _then(_$PostWritePostCommentEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PostWritePostCommentEntityImpl implements _PostWritePostCommentEntity {
  const _$PostWritePostCommentEntityImpl(
      {required this.message, required this.commentId});

  @override
  final String message;
  @override
  final int commentId;

  @override
  String toString() {
    return 'PostWritePostCommentEntity(message: $message, commentId: $commentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostWritePostCommentEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, commentId);

  /// Create a copy of PostWritePostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostWritePostCommentEntityImplCopyWith<_$PostWritePostCommentEntityImpl>
      get copyWith => __$$PostWritePostCommentEntityImplCopyWithImpl<
          _$PostWritePostCommentEntityImpl>(this, _$identity);
}

abstract class _PostWritePostCommentEntity
    implements PostWritePostCommentEntity {
  const factory _PostWritePostCommentEntity(
      {required final String message,
      required final int commentId}) = _$PostWritePostCommentEntityImpl;

  @override
  String get message;
  @override
  int get commentId;

  /// Create a copy of PostWritePostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostWritePostCommentEntityImplCopyWith<_$PostWritePostCommentEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
