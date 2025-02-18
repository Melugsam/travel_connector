// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['profile_description'] as String?,
      avatar: json['avatar'] as String?,
      followers: (json['followers'] as List<dynamic>)
          .map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>)
          .map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowing: json['isFollowing'] as bool,
      isCurrentUser: json['isCurrentUser'] as bool,
      posts: (json['posts'] as List<dynamic>)
          .map((e) =>
              ProfilePostResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_description': instance.description,
      'avatar': instance.avatar,
      'followers': instance.followers.map((e) => e.toJson()).toList(),
      'following': instance.following.map((e) => e.toJson()).toList(),
      'isFollowing': instance.isFollowing,
      'isCurrentUser': instance.isCurrentUser,
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };

ProfilePostResponseModel _$ProfilePostResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfilePostResponseModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      liked: json['liked'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProfilePostResponseModelToJson(
        ProfilePostResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'created_at': instance.createdAt,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'liked': instance.liked,
      'images': instance.images,
    };
