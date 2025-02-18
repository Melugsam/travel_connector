// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_write_comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostWriteCommentRequestModel _$PostWriteCommentRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostWriteCommentRequestModel(
      postId: (json['post_id'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$PostWriteCommentRequestModelToJson(
        PostWriteCommentRequestModel instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'content': instance.content,
    };
