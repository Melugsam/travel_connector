import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'profile_edit_request_model.g.dart';

@JsonSerializable()
class ProfileEditRequestModel {
  @JsonKey(name: 'user_id')
  final int userId;
  final String name;
  final String description;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final File avatarFile;

  ProfileEditRequestModel({
    required this.userId,
    required this.name,
    required this.description,
    required this.avatarFile,
  });

  Map<String, dynamic> toJson() => _$ProfileEditRequestModelToJson(this);

  factory ProfileEditRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileEditRequestModelFromJson(json);
}
