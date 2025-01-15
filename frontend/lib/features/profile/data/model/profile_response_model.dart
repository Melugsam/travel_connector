import 'package:json_annotation/json_annotation.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';

part 'profile_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileResponseModel {
  final int id;
  final String name;
  @JsonKey(name: 'profile_description')
  final String description;
  final String? avatar;
  final List<UserResponseModel> followers;
  final List<UserResponseModel> following;
  @JsonKey(name: 'is_current_user')
  final bool isCurrentUser;
  @JsonKey(name: 'current_user_following')
  final bool currentUserFollowing;

  ProfileResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.followers,
    required this.following,
    required this.isCurrentUser,
    required this.currentUserFollowing,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
