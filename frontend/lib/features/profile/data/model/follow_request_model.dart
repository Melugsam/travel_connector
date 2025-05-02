import 'package:json_annotation/json_annotation.dart';

part 'follow_request_model.g.dart';

@JsonSerializable()
class FollowRequestModel {
  @JsonKey(name: 'target_user_id')
  final int targetId;

  FollowRequestModel({required this.targetId});

  Map<String, dynamic> toJson() => _$FollowRequestModelToJson(this);
}
