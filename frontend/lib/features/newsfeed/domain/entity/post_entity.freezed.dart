// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostEntity {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  List<int> get likedBy => throw _privateConstructorUsedError;
  PostUserEntity get user => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<CommentEntity> get comments => throw _privateConstructorUsedError;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostEntityCopyWith<PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) then) =
      _$PostEntityCopyWithImpl<$Res, PostEntity>;
  @useResult
  $Res call(
      {int id,
      String description,
      String createdAt,
      int likesCount,
      int commentsCount,
      List<int> likedBy,
      PostUserEntity user,
      List<String> images,
      List<CommentEntity> comments});

  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res, $Val extends PostEntity>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? likedBy = null,
    Object? user = null,
    Object? images = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<int>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUserEntity,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
    ) as $Val);
  }

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostUserEntityCopyWith<$Res> get user {
    return $PostUserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostEntityImplCopyWith<$Res>
    implements $PostEntityCopyWith<$Res> {
  factory _$$PostEntityImplCopyWith(
          _$PostEntityImpl value, $Res Function(_$PostEntityImpl) then) =
      __$$PostEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      String createdAt,
      int likesCount,
      int commentsCount,
      List<int> likedBy,
      PostUserEntity user,
      List<String> images,
      List<CommentEntity> comments});

  @override
  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$PostEntityImplCopyWithImpl<$Res>
    extends _$PostEntityCopyWithImpl<$Res, _$PostEntityImpl>
    implements _$$PostEntityImplCopyWith<$Res> {
  __$$PostEntityImplCopyWithImpl(
      _$PostEntityImpl _value, $Res Function(_$PostEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? likedBy = null,
    Object? user = null,
    Object? images = null,
    Object? comments = null,
  }) {
    return _then(_$PostEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedBy: null == likedBy
          ? _value._likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as List<int>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUserEntity,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
    ));
  }
}

/// @nodoc

class _$PostEntityImpl implements _PostEntity {
  const _$PostEntityImpl(
      {required this.id,
      required this.description,
      required this.createdAt,
      required this.likesCount,
      required this.commentsCount,
      required final List<int> likedBy,
      required this.user,
      required final List<String> images,
      required final List<CommentEntity> comments})
      : _likedBy = likedBy,
        _images = images,
        _comments = comments;

  @override
  final int id;
  @override
  final String description;
  @override
  final String createdAt;
  @override
  final int likesCount;
  @override
  final int commentsCount;
  final List<int> _likedBy;
  @override
  List<int> get likedBy {
    if (_likedBy is EqualUnmodifiableListView) return _likedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedBy);
  }

  @override
  final PostUserEntity user;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<CommentEntity> _comments;
  @override
  List<CommentEntity> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'PostEntity(id: $id, description: $description, createdAt: $createdAt, likesCount: $likesCount, commentsCount: $commentsCount, likedBy: $likedBy, user: $user, images: $images, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._likedBy, _likedBy) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      createdAt,
      likesCount,
      commentsCount,
      const DeepCollectionEquality().hash(_likedBy),
      user,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_comments));

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostEntityImplCopyWith<_$PostEntityImpl> get copyWith =>
      __$$PostEntityImplCopyWithImpl<_$PostEntityImpl>(this, _$identity);
}

abstract class _PostEntity implements PostEntity {
  const factory _PostEntity(
      {required final int id,
      required final String description,
      required final String createdAt,
      required final int likesCount,
      required final int commentsCount,
      required final List<int> likedBy,
      required final PostUserEntity user,
      required final List<String> images,
      required final List<CommentEntity> comments}) = _$PostEntityImpl;

  @override
  int get id;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  List<int> get likedBy;
  @override
  PostUserEntity get user;
  @override
  List<String> get images;
  @override
  List<CommentEntity> get comments;

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostEntityImplCopyWith<_$PostEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostUserEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  /// Create a copy of PostUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostUserEntityCopyWith<PostUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserEntityCopyWith<$Res> {
  factory $PostUserEntityCopyWith(
          PostUserEntity value, $Res Function(PostUserEntity) then) =
      _$PostUserEntityCopyWithImpl<$Res, PostUserEntity>;
  @useResult
  $Res call({int id, String name, String? avatar});
}

/// @nodoc
class _$PostUserEntityCopyWithImpl<$Res, $Val extends PostUserEntity>
    implements $PostUserEntityCopyWith<$Res> {
  _$PostUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostUserEntityImplCopyWith<$Res>
    implements $PostUserEntityCopyWith<$Res> {
  factory _$$PostUserEntityImplCopyWith(_$PostUserEntityImpl value,
          $Res Function(_$PostUserEntityImpl) then) =
      __$$PostUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? avatar});
}

/// @nodoc
class __$$PostUserEntityImplCopyWithImpl<$Res>
    extends _$PostUserEntityCopyWithImpl<$Res, _$PostUserEntityImpl>
    implements _$$PostUserEntityImplCopyWith<$Res> {
  __$$PostUserEntityImplCopyWithImpl(
      _$PostUserEntityImpl _value, $Res Function(_$PostUserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(_$PostUserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PostUserEntityImpl implements _PostUserEntity {
  const _$PostUserEntityImpl(
      {required this.id, required this.name, this.avatar});

  @override
  final int id;
  @override
  final String name;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'PostUserEntity(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  /// Create a copy of PostUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostUserEntityImplCopyWith<_$PostUserEntityImpl> get copyWith =>
      __$$PostUserEntityImplCopyWithImpl<_$PostUserEntityImpl>(
          this, _$identity);
}

abstract class _PostUserEntity implements PostUserEntity {
  const factory _PostUserEntity(
      {required final int id,
      required final String name,
      final String? avatar}) = _$PostUserEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get avatar;

  /// Create a copy of PostUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostUserEntityImplCopyWith<_$PostUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentEntity {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  PostUserEntity get user => throw _privateConstructorUsedError;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentEntityCopyWith<CommentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEntityCopyWith<$Res> {
  factory $CommentEntityCopyWith(
          CommentEntity value, $Res Function(CommentEntity) then) =
      _$CommentEntityCopyWithImpl<$Res, CommentEntity>;
  @useResult
  $Res call({int id, String content, String createdAt, PostUserEntity user});

  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$CommentEntityCopyWithImpl<$Res, $Val extends CommentEntity>
    implements $CommentEntityCopyWith<$Res> {
  _$CommentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUserEntity,
    ) as $Val);
  }

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostUserEntityCopyWith<$Res> get user {
    return $PostUserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentEntityImplCopyWith<$Res>
    implements $CommentEntityCopyWith<$Res> {
  factory _$$CommentEntityImplCopyWith(
          _$CommentEntityImpl value, $Res Function(_$CommentEntityImpl) then) =
      __$$CommentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String content, String createdAt, PostUserEntity user});

  @override
  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$CommentEntityImplCopyWithImpl<$Res>
    extends _$CommentEntityCopyWithImpl<$Res, _$CommentEntityImpl>
    implements _$$CommentEntityImplCopyWith<$Res> {
  __$$CommentEntityImplCopyWithImpl(
      _$CommentEntityImpl _value, $Res Function(_$CommentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(_$CommentEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as PostUserEntity,
    ));
  }
}

/// @nodoc

class _$CommentEntityImpl implements _CommentEntity {
  const _$CommentEntityImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.user});

  @override
  final int id;
  @override
  final String content;
  @override
  final String createdAt;
  @override
  final PostUserEntity user;

  @override
  String toString() {
    return 'CommentEntity(id: $id, content: $content, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt, user);

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentEntityImplCopyWith<_$CommentEntityImpl> get copyWith =>
      __$$CommentEntityImplCopyWithImpl<_$CommentEntityImpl>(this, _$identity);
}

abstract class _CommentEntity implements CommentEntity {
  const factory _CommentEntity(
      {required final int id,
      required final String content,
      required final String createdAt,
      required final PostUserEntity user}) = _$CommentEntityImpl;

  @override
  int get id;
  @override
  String get content;
  @override
  String get createdAt;
  @override
  PostUserEntity get user;

  /// Create a copy of CommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentEntityImplCopyWith<_$CommentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
