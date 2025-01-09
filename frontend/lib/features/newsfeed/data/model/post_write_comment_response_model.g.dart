// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_write_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostWriteCommentResponseModel _$PostWriteCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PostWriteCommentResponseModel(
      message: json['message'] as String,
      commentId: (json['comment_id'] as num).toInt(),
    );

Map<String, dynamic> _$PostWriteCommentResponseModelToJson(
        PostWriteCommentResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'comment_id': instance.commentId,
    };
