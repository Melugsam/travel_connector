// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponseModel _$CityResponseModelFromJson(Map<String, dynamic> json) =>
    CityResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityResponseModelToJson(CityResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String,
      countryCode: json['countryCode'] as String,
      stateCode: json['stateCode'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
      'countryCode': instance.countryCode,
      'stateCode': instance.stateCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
