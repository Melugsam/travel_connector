import 'package:json_annotation/json_annotation.dart';

part 'profile_request_model.g.dart';

@JsonSerializable()
class ProfileRequestModel {
  @JsonKey(name: 'target_user_id')
  final int? targetUserId;

  ProfileRequestModel({required this.targetUserId});

  Map<String, dynamic> toJson() => _$ProfileRequestModelToJson(this);

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestModelFromJson(json);

}