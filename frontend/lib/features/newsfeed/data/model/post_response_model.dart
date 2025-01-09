import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PostResponseModel {
  final int id;
  final String description;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @JsonKey(name: 'liked_by')
  final List<int> likedBy;
  final bool liked;
  final UserResponseModel user;
  final List<String> images;
  final List<CommentResponseModel> comments;

  PostResponseModel({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.likesCount,
    required this.commentsCount,
    required this.likedBy,
    required this.liked,
    required this.user,
    required this.images,
    required this.comments,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseModelToJson(this);
}

@JsonSerializable()
class UserResponseModel {
  final int id;
  final String name;
  final String? avatar;

  UserResponseModel({
    required this.id,
    required this.name,
    this.avatar,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommentResponseModel {
  final int id;
  final String content;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final UserResponseModel user;

  CommentResponseModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.user,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseModelToJson(this);
}
