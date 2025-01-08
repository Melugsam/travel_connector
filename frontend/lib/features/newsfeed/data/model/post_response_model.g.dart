// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseModel _$PostResponseModelFromJson(Map<String, dynamic> json) =>
    PostResponseModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      likedBy: (json['liked_by'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostResponseModelToJson(PostResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'created_at': instance.createdAt,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'liked_by': instance.likedBy,
      'user': instance.user.toJson(),
      'images': instance.images,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

CommentResponseModel _$CommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CommentResponseModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentResponseModelToJson(
        CommentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt,
      'user': instance.user.toJson(),
    };
