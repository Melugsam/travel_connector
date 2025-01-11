import 'package:json_annotation/json_annotation.dart';
part 'profile_edit_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileEditResponseModel {
  final String message;

  ProfileEditResponseModel({
    required this.message
  });

  factory ProfileEditResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileEditResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEditResponseModelToJson(this);
}
