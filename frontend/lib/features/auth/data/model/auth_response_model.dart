import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  @JsonKey(name: 'access_token')
  final String accessToken;

  AuthResponseModel({required this.accessToken});

  factory AuthResponseModel.fromJson(
      Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AuthResponseModelToJson(this);
}
