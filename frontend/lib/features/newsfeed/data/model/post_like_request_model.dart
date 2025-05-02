import 'package:json_annotation/json_annotation.dart';

part 'post_like_request_model.g.dart';

@JsonSerializable()
class PostLikeRequestModel {
  @JsonKey(name: 'post_id')
  final int postId;

  PostLikeRequestModel({required this.postId});

  Map<String, dynamic> toJson() => _$PostLikeRequestModelToJson(this);

  factory PostLikeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostLikeRequestModelFromJson(json);

}