import 'package:json_annotation/json_annotation.dart';

part 'server_error_model.g.dart';

@JsonSerializable()
class ServerErrorModel {
  final int? errorCode;
  final String details;

  ServerErrorModel({required this.errorCode, required this.details});

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) => _$ServerErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorModelToJson(this);
}