import 'package:json_annotation/json_annotation.dart';

part 'post_comment_request_model.g.dart';

@JsonSerializable()
class PostCommentRequestModel {
  @JsonKey(name: 'post_id')
  final int postId;

  PostCommentRequestModel({required this.postId});

  Map<String, dynamic> toJson() => _$PostCommentRequestModelToJson(this);

  factory PostCommentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostCommentRequestModelFromJson(json);

}