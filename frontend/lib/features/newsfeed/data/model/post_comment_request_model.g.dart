// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentRequestModel _$PostCommentRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostCommentRequestModel(
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$PostCommentRequestModelToJson(
        PostCommentRequestModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
    };
