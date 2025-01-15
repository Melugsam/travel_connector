// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      cod: json['cod'] as String,
      message: (json['message'] as num).toInt(),
      cnt: (json['cnt'] as num).toInt(),
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) =>
    WeatherDataModel(
      dt: (json['dt'] as num).toInt(),
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      pop: (json['pop'] as num).toDouble(),
      sys: SysModel.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String,
    );

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
    };

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      humidity: (json['humidity'] as num).toInt(),
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

CloudsModel _$CloudsModelFromJson(Map<String, dynamic> json) => CloudsModel(
      all: (json['all'] as num).toInt(),
    );

Map<String, dynamic> _$CloudsModelToJson(CloudsModel instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

WindModel _$WindModelFromJson(Map<String, dynamic> json) => WindModel(
      speed: (json['speed'] as num).toDouble(),
      deg: (json['deg'] as num).toInt(),
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

SysModel _$SysModelFromJson(Map<String, dynamic> json) => SysModel(
      pod: json['pod'] as String,
    );

Map<String, dynamic> _$SysModelToJson(SysModel instance) => <String, dynamic>{
      'pod': instance.pod,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
    };

CoordModel _$CoordModelFromJson(Map<String, dynamic> json) => CoordModel(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordModelToJson(CoordModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
