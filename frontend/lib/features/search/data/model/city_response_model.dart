import 'package:json_annotation/json_annotation.dart';

part 'city_response_model.g.dart';

@JsonSerializable()
class CityResponseModel {
  final List<FeatureModel> features;

  CityResponseModel({
    required this.features,
  });

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseModelToJson(this);
}

@JsonSerializable()
class FeatureModel {
  final PropertiesModel properties;

  FeatureModel({
    required this.properties,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);
}

@JsonSerializable()
class PropertiesModel {
  final String? city;
  final String? country;
  final double? lon;
  final double? lat;
  final String? region;


  PropertiesModel({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
    required this.region,
  });

  factory PropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$PropertiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesModelToJson(this);
}
