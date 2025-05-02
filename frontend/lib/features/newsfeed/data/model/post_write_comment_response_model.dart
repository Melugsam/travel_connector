import 'package:json_annotation/json_annotation.dart';

part 'post_write_comment_response_model.g.dart';

@JsonSerializable()
class PostWriteCommentResponseModel {
  final String message;
  @JsonKey(name: 'comment_id')
  final int commentId;

  PostWriteCommentResponseModel({
    required this.message,
    required this.commentId,
  });

  factory PostWriteCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostWriteCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostWriteCommentResponseModelToJson(this);
}
