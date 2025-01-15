import 'package:json_annotation/json_annotation.dart';

part 'city_response_model.g.dart';

@JsonSerializable()
class CityResponseModel {
  final List<CityModel> data;

  CityResponseModel({
    required this.data,
  });

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final String name;
  final String countryCode;
  final String stateCode;
  final String latitude;
  final String longitude;

  CityModel({
    required this.name,
    required this.countryCode,
    required this.stateCode,
    required this.latitude,
    required this.longitude,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
