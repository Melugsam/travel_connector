// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikeResponseModel _$PostLikeResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostLikeResponseModel(
      message: json['message'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      likedBy: (json['liked_by'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$PostLikeResponseModelToJson(
        PostLikeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'likes_count': instance.likesCount,
      'liked_by': instance.likedBy,
    };
