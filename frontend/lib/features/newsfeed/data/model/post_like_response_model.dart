import 'package:json_annotation/json_annotation.dart';

part 'post_like_response_model.g.dart';

@JsonSerializable()
class PostLikeResponseModel {
  final String message;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'liked_by')
  final List<int> likedBy;

  PostLikeResponseModel({
    required this.message,
    required this.likesCount,
    required this.likedBy,
  });

  factory PostLikeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostLikeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostLikeResponseModelToJson(this);
}
