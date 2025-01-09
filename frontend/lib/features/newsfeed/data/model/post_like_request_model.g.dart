// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLikeRequestModel _$PostLikeRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostLikeRequestModel(
      userId: (json['user_id'] as num).toInt(),
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$PostLikeRequestModelToJson(
        PostLikeRequestModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'post_id': instance.postId,
    };
