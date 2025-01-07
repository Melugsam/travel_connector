import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final int id;
  final String email;

  AuthResponseModel({required this.id, required this.email});

  factory AuthResponseModel.fromJson(
      Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AuthResponseModelToJson(this);
}
