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
      avatar: json['avatar'] as String?,
      followers: (json['followers'] as List<dynamic>)
          .map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>)
          .map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCurrentUser: json['is_current_user'] as bool,
      currentUserFollowing: json['current_user_following'] as bool,
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'followers': instance.followers.map((e) => e.toJson()).toList(),
      'following': instance.following.map((e) => e.toJson()).toList(),
      'is_current_user': instance.isCurrentUser,
      'current_user_following': instance.currentUserFollowing,
    };
