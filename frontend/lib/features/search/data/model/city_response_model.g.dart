// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponseModel _$CityResponseModelFromJson(Map<String, dynamic> json) =>
    CityResponseModel(
      features: (json['features'] as List<dynamic>)
          .map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityResponseModelToJson(CityResponseModel instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) => FeatureModel(
      properties:
          PropertiesModel.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureModelToJson(FeatureModel instance) =>
    <String, dynamic>{
      'properties': instance.properties,
    };

PropertiesModel _$PropertiesModelFromJson(Map<String, dynamic> json) =>
    PropertiesModel(
      city: json['city'] as String?,
      country: json['country'] as String?,
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      region: json['region'] as String?,
    );

Map<String, dynamic> _$PropertiesModelToJson(PropertiesModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'lon': instance.lon,
      'lat': instance.lat,
      'region': instance.region,
    };
