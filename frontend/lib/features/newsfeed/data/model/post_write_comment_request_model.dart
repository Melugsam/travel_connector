import 'package:json_annotation/json_annotation.dart';

part 'post_write_comment_request_model.g.dart';

@JsonSerializable()
class PostWriteCommentRequestModel {
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'post_id')
  final int postId;
  final String content;

  PostWriteCommentRequestModel({required this.userId, required this.postId, required this.content});

  Map<String, dynamic> toJson() => _$PostWriteCommentRequestModelToJson(this);

  factory PostWriteCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostWriteCommentRequestModelFromJson(json);

}