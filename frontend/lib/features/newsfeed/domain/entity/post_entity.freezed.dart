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
  String? get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  List<int> get likedBy => throw _privateConstructorUsedError;
  PostUserEntity get user => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<PostCommentEntity> get comments => throw _privateConstructorUsedError;
  MapRouteEntity? get route => throw _privateConstructorUsedError;

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
      String? title,
      String description,
      String createdAt,
      int likesCount,
      bool liked,
      int commentsCount,
      List<int> likedBy,
      PostUserEntity user,
      List<String> images,
      List<PostCommentEntity> comments,
      MapRouteEntity? route});

  $PostUserEntityCopyWith<$Res> get user;
  $MapRouteEntityCopyWith<$Res>? get route;
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
    Object? title = freezed,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? liked = null,
    Object? commentsCount = null,
    Object? likedBy = null,
    Object? user = null,
    Object? images = null,
    Object? comments = null,
    Object? route = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<PostCommentEntity>,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as MapRouteEntity?,
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

  /// Create a copy of PostEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MapRouteEntityCopyWith<$Res>? get route {
    if (_value.route == null) {
      return null;
    }

    return $MapRouteEntityCopyWith<$Res>(_value.route!, (value) {
      return _then(_value.copyWith(route: value) as $Val);
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
      String? title,
      String description,
      String createdAt,
      int likesCount,
      bool liked,
      int commentsCount,
      List<int> likedBy,
      PostUserEntity user,
      List<String> images,
      List<PostCommentEntity> comments,
      MapRouteEntity? route});

  @override
  $PostUserEntityCopyWith<$Res> get user;
  @override
  $MapRouteEntityCopyWith<$Res>? get route;
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
    Object? title = freezed,
    Object? description = null,
    Object? createdAt = null,
    Object? likesCount = null,
    Object? liked = null,
    Object? commentsCount = null,
    Object? likedBy = null,
    Object? user = null,
    Object? images = null,
    Object? comments = null,
    Object? route = freezed,
  }) {
    return _then(_$PostEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as List<PostCommentEntity>,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as MapRouteEntity?,
    ));
  }
}

/// @nodoc

class _$PostEntityImpl implements _PostEntity {
  const _$PostEntityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.likesCount,
      required this.liked,
      required this.commentsCount,
      required final List<int> likedBy,
      required this.user,
      required final List<String> images,
      required final List<PostCommentEntity> comments,
      this.route})
      : _likedBy = likedBy,
        _images = images,
        _comments = comments;

  @override
  final int id;
  @override
  final String? title;
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

  final List<PostCommentEntity> _comments;
  @override
  List<PostCommentEntity> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final MapRouteEntity? route;

  @override
  String toString() {
    return 'PostEntity(id: $id, title: $title, description: $description, createdAt: $createdAt, likesCount: $likesCount, liked: $liked, commentsCount: $commentsCount, likedBy: $likedBy, user: $user, images: $images, comments: $comments, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._likedBy, _likedBy) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      createdAt,
      likesCount,
      liked,
      commentsCount,
      const DeepCollectionEquality().hash(_likedBy),
      user,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_comments),
      route);

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
      required final String? title,
      required final String description,
      required final String createdAt,
      required final int likesCount,
      required final bool liked,
      required final int commentsCount,
      required final List<int> likedBy,
      required final PostUserEntity user,
      required final List<String> images,
      required final List<PostCommentEntity> comments,
      final MapRouteEntity? route}) = _$PostEntityImpl;

  @override
  int get id;
  @override
  String? get title;
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
  List<int> get likedBy;
  @override
  PostUserEntity get user;
  @override
  List<String> get images;
  @override
  List<PostCommentEntity> get comments;
  @override
  MapRouteEntity? get route;

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
mixin _$PostCommentEntity {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  PostUserEntity get user => throw _privateConstructorUsedError;

  /// Create a copy of PostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCommentEntityCopyWith<PostCommentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentEntityCopyWith<$Res> {
  factory $PostCommentEntityCopyWith(
          PostCommentEntity value, $Res Function(PostCommentEntity) then) =
      _$PostCommentEntityCopyWithImpl<$Res, PostCommentEntity>;
  @useResult
  $Res call({int id, String content, String createdAt, PostUserEntity user});

  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$PostCommentEntityCopyWithImpl<$Res, $Val extends PostCommentEntity>
    implements $PostCommentEntityCopyWith<$Res> {
  _$PostCommentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostCommentEntity
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

  /// Create a copy of PostCommentEntity
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
abstract class _$$PostCommentEntityImplCopyWith<$Res>
    implements $PostCommentEntityCopyWith<$Res> {
  factory _$$PostCommentEntityImplCopyWith(_$PostCommentEntityImpl value,
          $Res Function(_$PostCommentEntityImpl) then) =
      __$$PostCommentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String content, String createdAt, PostUserEntity user});

  @override
  $PostUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$PostCommentEntityImplCopyWithImpl<$Res>
    extends _$PostCommentEntityCopyWithImpl<$Res, _$PostCommentEntityImpl>
    implements _$$PostCommentEntityImplCopyWith<$Res> {
  __$$PostCommentEntityImplCopyWithImpl(_$PostCommentEntityImpl _value,
      $Res Function(_$PostCommentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(_$PostCommentEntityImpl(
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

class _$PostCommentEntityImpl implements _PostCommentEntity {
  const _$PostCommentEntityImpl(
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
    return 'PostCommentEntity(id: $id, content: $content, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, content, createdAt, user);

  /// Create a copy of PostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentEntityImplCopyWith<_$PostCommentEntityImpl> get copyWith =>
      __$$PostCommentEntityImplCopyWithImpl<_$PostCommentEntityImpl>(
          this, _$identity);
}

abstract class _PostCommentEntity implements PostCommentEntity {
  const factory _PostCommentEntity(
      {required final int id,
      required final String content,
      required final String createdAt,
      required final PostUserEntity user}) = _$PostCommentEntityImpl;

  @override
  int get id;
  @override
  String get content;
  @override
  String get createdAt;
  @override
  PostUserEntity get user;

  /// Create a copy of PostCommentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostCommentEntityImplCopyWith<_$PostCommentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapRouteEntity {
  List<MarkerEntity> get markers => throw _privateConstructorUsedError;
  List<RouteConnectionEntity> get routes => throw _privateConstructorUsedError;

  /// Create a copy of MapRouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapRouteEntityCopyWith<MapRouteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapRouteEntityCopyWith<$Res> {
  factory $MapRouteEntityCopyWith(
          MapRouteEntity value, $Res Function(MapRouteEntity) then) =
      _$MapRouteEntityCopyWithImpl<$Res, MapRouteEntity>;
  @useResult
  $Res call({List<MarkerEntity> markers, List<RouteConnectionEntity> routes});
}

/// @nodoc
class _$MapRouteEntityCopyWithImpl<$Res, $Val extends MapRouteEntity>
    implements $MapRouteEntityCopyWith<$Res> {
  _$MapRouteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapRouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? routes = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerEntity>,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteConnectionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapRouteEntityImplCopyWith<$Res>
    implements $MapRouteEntityCopyWith<$Res> {
  factory _$$MapRouteEntityImplCopyWith(_$MapRouteEntityImpl value,
          $Res Function(_$MapRouteEntityImpl) then) =
      __$$MapRouteEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MarkerEntity> markers, List<RouteConnectionEntity> routes});
}

/// @nodoc
class __$$MapRouteEntityImplCopyWithImpl<$Res>
    extends _$MapRouteEntityCopyWithImpl<$Res, _$MapRouteEntityImpl>
    implements _$$MapRouteEntityImplCopyWith<$Res> {
  __$$MapRouteEntityImplCopyWithImpl(
      _$MapRouteEntityImpl _value, $Res Function(_$MapRouteEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapRouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? routes = null,
  }) {
    return _then(_$MapRouteEntityImpl(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerEntity>,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteConnectionEntity>,
    ));
  }
}

/// @nodoc

class _$MapRouteEntityImpl implements _MapRouteEntity {
  const _$MapRouteEntityImpl(
      {required final List<MarkerEntity> markers,
      required final List<RouteConnectionEntity> routes})
      : _markers = markers,
        _routes = routes;

  final List<MarkerEntity> _markers;
  @override
  List<MarkerEntity> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  final List<RouteConnectionEntity> _routes;
  @override
  List<RouteConnectionEntity> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString() {
    return 'MapRouteEntity(markers: $markers, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapRouteEntityImpl &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_routes));

  /// Create a copy of MapRouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapRouteEntityImplCopyWith<_$MapRouteEntityImpl> get copyWith =>
      __$$MapRouteEntityImplCopyWithImpl<_$MapRouteEntityImpl>(
          this, _$identity);
}

abstract class _MapRouteEntity implements MapRouteEntity {
  const factory _MapRouteEntity(
          {required final List<MarkerEntity> markers,
          required final List<RouteConnectionEntity> routes}) =
      _$MapRouteEntityImpl;

  @override
  List<MarkerEntity> get markers;
  @override
  List<RouteConnectionEntity> get routes;

  /// Create a copy of MapRouteEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapRouteEntityImplCopyWith<_$MapRouteEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarkerEntity {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Create a copy of MarkerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarkerEntityCopyWith<MarkerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkerEntityCopyWith<$Res> {
  factory $MarkerEntityCopyWith(
          MarkerEntity value, $Res Function(MarkerEntity) then) =
      _$MarkerEntityCopyWithImpl<$Res, MarkerEntity>;
  @useResult
  $Res call({double latitude, double longitude, String type, String? label});
}

/// @nodoc
class _$MarkerEntityCopyWithImpl<$Res, $Val extends MarkerEntity>
    implements $MarkerEntityCopyWith<$Res> {
  _$MarkerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarkerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkerEntityImplCopyWith<$Res>
    implements $MarkerEntityCopyWith<$Res> {
  factory _$$MarkerEntityImplCopyWith(
          _$MarkerEntityImpl value, $Res Function(_$MarkerEntityImpl) then) =
      __$$MarkerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, String type, String? label});
}

/// @nodoc
class __$$MarkerEntityImplCopyWithImpl<$Res>
    extends _$MarkerEntityCopyWithImpl<$Res, _$MarkerEntityImpl>
    implements _$$MarkerEntityImplCopyWith<$Res> {
  __$$MarkerEntityImplCopyWithImpl(
      _$MarkerEntityImpl _value, $Res Function(_$MarkerEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MarkerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? label = freezed,
  }) {
    return _then(_$MarkerEntityImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MarkerEntityImpl implements _MarkerEntity {
  const _$MarkerEntityImpl(
      {required this.latitude,
      required this.longitude,
      required this.type,
      this.label});

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String type;
  @override
  final String? label;

  @override
  String toString() {
    return 'MarkerEntity(latitude: $latitude, longitude: $longitude, type: $type, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkerEntityImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, type, label);

  /// Create a copy of MarkerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkerEntityImplCopyWith<_$MarkerEntityImpl> get copyWith =>
      __$$MarkerEntityImplCopyWithImpl<_$MarkerEntityImpl>(this, _$identity);
}

abstract class _MarkerEntity implements MarkerEntity {
  const factory _MarkerEntity(
      {required final double latitude,
      required final double longitude,
      required final String type,
      final String? label}) = _$MarkerEntityImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get type;
  @override
  String? get label;

  /// Create a copy of MarkerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkerEntityImplCopyWith<_$MarkerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteConnectionEntity {
  int get fromIndex => throw _privateConstructorUsedError;
  int get toIndex => throw _privateConstructorUsedError;

  /// Create a copy of RouteConnectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteConnectionEntityCopyWith<RouteConnectionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteConnectionEntityCopyWith<$Res> {
  factory $RouteConnectionEntityCopyWith(RouteConnectionEntity value,
          $Res Function(RouteConnectionEntity) then) =
      _$RouteConnectionEntityCopyWithImpl<$Res, RouteConnectionEntity>;
  @useResult
  $Res call({int fromIndex, int toIndex});
}

/// @nodoc
class _$RouteConnectionEntityCopyWithImpl<$Res,
        $Val extends RouteConnectionEntity>
    implements $RouteConnectionEntityCopyWith<$Res> {
  _$RouteConnectionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteConnectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromIndex = null,
    Object? toIndex = null,
  }) {
    return _then(_value.copyWith(
      fromIndex: null == fromIndex
          ? _value.fromIndex
          : fromIndex // ignore: cast_nullable_to_non_nullable
              as int,
      toIndex: null == toIndex
          ? _value.toIndex
          : toIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteConnectionEntityImplCopyWith<$Res>
    implements $RouteConnectionEntityCopyWith<$Res> {
  factory _$$RouteConnectionEntityImplCopyWith(
          _$RouteConnectionEntityImpl value,
          $Res Function(_$RouteConnectionEntityImpl) then) =
      __$$RouteConnectionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int fromIndex, int toIndex});
}

/// @nodoc
class __$$RouteConnectionEntityImplCopyWithImpl<$Res>
    extends _$RouteConnectionEntityCopyWithImpl<$Res,
        _$RouteConnectionEntityImpl>
    implements _$$RouteConnectionEntityImplCopyWith<$Res> {
  __$$RouteConnectionEntityImplCopyWithImpl(_$RouteConnectionEntityImpl _value,
      $Res Function(_$RouteConnectionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteConnectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromIndex = null,
    Object? toIndex = null,
  }) {
    return _then(_$RouteConnectionEntityImpl(
      fromIndex: null == fromIndex
          ? _value.fromIndex
          : fromIndex // ignore: cast_nullable_to_non_nullable
              as int,
      toIndex: null == toIndex
          ? _value.toIndex
          : toIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RouteConnectionEntityImpl implements _RouteConnectionEntity {
  const _$RouteConnectionEntityImpl(
      {required this.fromIndex, required this.toIndex});

  @override
  final int fromIndex;
  @override
  final int toIndex;

  @override
  String toString() {
    return 'RouteConnectionEntity(fromIndex: $fromIndex, toIndex: $toIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteConnectionEntityImpl &&
            (identical(other.fromIndex, fromIndex) ||
                other.fromIndex == fromIndex) &&
            (identical(other.toIndex, toIndex) || other.toIndex == toIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromIndex, toIndex);

  /// Create a copy of RouteConnectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteConnectionEntityImplCopyWith<_$RouteConnectionEntityImpl>
      get copyWith => __$$RouteConnectionEntityImplCopyWithImpl<
          _$RouteConnectionEntityImpl>(this, _$identity);
}

abstract class _RouteConnectionEntity implements RouteConnectionEntity {
  const factory _RouteConnectionEntity(
      {required final int fromIndex,
      required final int toIndex}) = _$RouteConnectionEntityImpl;

  @override
  int get fromIndex;
  @override
  int get toIndex;

  /// Create a copy of RouteConnectionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteConnectionEntityImplCopyWith<_$RouteConnectionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
