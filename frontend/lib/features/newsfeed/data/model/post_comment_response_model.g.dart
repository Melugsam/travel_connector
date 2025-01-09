// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentResponseModel _$PostCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostCommentResponseModel(
      postId: (json['post_id'] as num).toInt(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostCommentResponseModelToJson(
        PostCommentResponseModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
