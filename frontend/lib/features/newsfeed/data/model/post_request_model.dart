import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_request_model.g.dart';

@JsonSerializable()
class PostRequestModel {
  final int? offset;
  final int? limit;

  PostRequestModel({required this.offset, required this.limit});

  Map<String, dynamic> toJson() => _$PostRequestModelToJson(this);

  factory PostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostRequestModelFromJson(json);

}
