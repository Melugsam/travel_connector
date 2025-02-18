// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<PostUserEntity> get followers => throw _privateConstructorUsedError;
  List<PostUserEntity> get following => throw _privateConstructorUsedError;
  bool get isCurrentUser => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  List<ProfilePostEntity> get posts => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) then) =
      _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String? avatar,
      List<PostUserEntity> followers,
      List<PostUserEntity> following,
      bool isCurrentUser,
      bool isFollowing,
      List<ProfilePostEntity> posts});
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? avatar = freezed,
    Object? followers = null,
    Object? following = null,
    Object? isCurrentUser = null,
    Object? isFollowing = null,
    Object? posts = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<PostUserEntity>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<PostUserEntity>,
      isCurrentUser: null == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ProfilePostEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
          _$ProfileEntityImpl value, $Res Function(_$ProfileEntityImpl) then) =
      __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String? avatar,
      List<PostUserEntity> followers,
      List<PostUserEntity> following,
      bool isCurrentUser,
      bool isFollowing,
      List<ProfilePostEntity> posts});
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
      _$ProfileEntityImpl _value, $Res Function(_$ProfileEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? avatar = freezed,
    Object? followers = null,
    Object? following = null,
    Object? isCurrentUser = null,
    Object? isFollowing = null,
    Object? posts = null,
  }) {
    return _then(_$ProfileEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<PostUserEntity>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<PostUserEntity>,
      isCurrentUser: null == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ProfilePostEntity>,
    ));
  }
}

/// @nodoc

class _$ProfileEntityImpl implements _ProfileEntity {
  const _$ProfileEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      this.avatar,
      required final List<PostUserEntity> followers,
      required final List<PostUserEntity> following,
      required this.isCurrentUser,
      required this.isFollowing,
      required final List<ProfilePostEntity> posts})
      : _followers = followers,
        _following = following,
        _posts = posts;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? avatar;
  final List<PostUserEntity> _followers;
  @override
  List<PostUserEntity> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  final List<PostUserEntity> _following;
  @override
  List<PostUserEntity> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  final bool isCurrentUser;
  @override
  final bool isFollowing;
  final List<ProfilePostEntity> _posts;
  @override
  List<ProfilePostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'ProfileEntity(id: $id, name: $name, description: $description, avatar: $avatar, followers: $followers, following: $following, isCurrentUser: $isCurrentUser, isFollowing: $isFollowing, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      avatar,
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following),
      isCurrentUser,
      isFollowing,
      const DeepCollectionEquality().hash(_posts));

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);
}

abstract class _ProfileEntity implements ProfileEntity {
  const factory _ProfileEntity(
      {required final int id,
      required final String name,
      required final String description,
      final String? avatar,
      required final List<PostUserEntity> followers,
      required final List<PostUserEntity> following,
      required final bool isCurrentUser,
      required final bool isFollowing,
      required final List<ProfilePostEntity> posts}) = _$ProfileEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get avatar;
  @override
  List<PostUserEntity> get followers;
  @override
  List<PostUserEntity> get following;
  @override
  bool get isCurrentUser;
  @override
  bool get isFollowing;
  @override
  List<ProfilePostEntity> get posts;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfilePostEntity {
  int get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Create a copy of ProfilePostEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilePostEntityCopyWith<ProfilePostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePostEntityCopyWith<$Res> {
  factory $ProfilePostEntityCopyWith(
          ProfilePostEntity value, $Res Function(ProfilePostEntity) then) =
      _$ProfilePostEntityCopyWithImpl<$Res, ProfilePostEntity>;
  @useResult
  $Res call(
      {int id,
      String description,
      String createdAt,
      int likesCount,
      bool liked,
      int commentsCount,
      List<String> images});
}

/// @nodoc
class _$ProfilePostEntityCopyWithImpl<$Res, $Val extends ProfilePostEntity>
    implements $ProfilePostEntityCopyWith<$Res> {
  _$ProfilePostEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePostEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? liked = null,
    Object? commentsCount = null,
    Object? images = null,
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
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilePostEntityImplCopyWith<$Res>
    implements $ProfilePostEntityCopyWith<$Res> {
  factory _$$ProfilePostEntityImplCopyWith(_$ProfilePostEntityImpl value,
          $Res Function(_$ProfilePostEntityImpl) then) =
      __$$ProfilePostEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String description,
      String createdAt,
      int likesCount,
      bool liked,
      int commentsCount,
      List<String> images});
}

/// @nodoc
class __$$ProfilePostEntityImplCopyWithImpl<$Res>
    extends _$ProfilePostEntityCopyWithImpl<$Res, _$ProfilePostEntityImpl>
    implements _$$ProfilePostEntityImplCopyWith<$Res> {
  __$$ProfilePostEntityImplCopyWithImpl(_$ProfilePostEntityImpl _value,
      $Res Function(_$ProfilePostEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePostEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? liked = null,
    Object? commentsCount = null,
    Object? images = null,
  }) {
    return _then(_$ProfilePostEntityImpl(
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
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProfilePostEntityImpl implements _ProfilePostEntity {
  const _$ProfilePostEntityImpl(
      {required this.id,
      required this.description,
      required this.createdAt,
      required this.likesCount,
      required this.liked,
      required this.commentsCount,
      required final List<String> images})
      : _images = images;

  @override
  final int id;
  @override
  final String description;
  @override
  final String createdAt;
  @override
  final int likesCount;
  @override
  final bool liked;
  @override
  final int commentsCount;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProfilePostEntity(id: $id, description: $description, createdAt: $createdAt, likesCount: $likesCount, liked: $liked, commentsCount: $commentsCount, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePostEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      createdAt,
      likesCount,
      liked,
      commentsCount,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of ProfilePostEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePostEntityImplCopyWith<_$ProfilePostEntityImpl> get copyWith =>
      __$$ProfilePostEntityImplCopyWithImpl<_$ProfilePostEntityImpl>(
          this, _$identity);
}

abstract class _ProfilePostEntity implements ProfilePostEntity {
  const factory _ProfilePostEntity(
      {required final int id,
      required final String description,
      required final String createdAt,
      required final int likesCount,
      required final bool liked,
      required final int commentsCount,
      required final List<String> images}) = _$ProfilePostEntityImpl;

  @override
  int get id;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  int get likesCount;
  @override
  bool get liked;
  @override
  int get commentsCount;
  @override
  List<String> get images;

  /// Create a copy of ProfilePostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilePostEntityImplCopyWith<_$ProfilePostEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
