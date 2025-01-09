import 'package:json_annotation/json_annotation.dart';

import 'post_response_model.dart';

part 'post_comment_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PostCommentResponseModel {
  @JsonKey(name: 'post_id')
  final int postId;
  final List<CommentResponseModel> comments;

  PostCommentResponseModel({
    required this.postId,
    required this.comments,
  });

  factory PostCommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostCommentResponseModelToJson(this);
}
