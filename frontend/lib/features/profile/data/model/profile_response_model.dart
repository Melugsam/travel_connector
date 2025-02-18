import 'package:json_annotation/json_annotation.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';

part 'profile_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileResponseModel {
  final int id;
  final String name;
  @JsonKey(name: 'profile_description')
  final String? description;
  final String? avatar;
  final List<UserResponseModel> followers;
  final List<UserResponseModel> following;
  final bool isFollowing;
  final bool isCurrentUser;
  final List<ProfilePostResponseModel> posts;

  ProfileResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.followers,
    required this.following,
    required this.isFollowing,
    required this.isCurrentUser,
    required this.posts,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProfilePostResponseModel {
  final int id;
  final String description;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  final bool liked;
  final List<String> images;

  factory ProfilePostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilePostResponseModelFromJson(json);

  ProfilePostResponseModel({required this.id, required this.description, required this.createdAt, required this.likesCount, required this.commentsCount, required this.liked, required this.images});

  Map<String, dynamic> toJson() => _$ProfilePostResponseModelToJson(this);
}
