import 'package:json_annotation/json_annotation.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherDataModel> list;
  final CityModel city;

  WeatherResponseModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}

@JsonSerializable()
class WeatherDataModel {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final double pop;
  final SysModel sys;
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  WeatherDataModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataModelToJson(this);
}

@JsonSerializable()
class MainModel {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}

@JsonSerializable()
class WeatherModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class CloudsModel {
  final int all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsModelToJson(this);
}

@JsonSerializable()
class WindModel {
  final double speed;
  final int deg;

  WindModel({required this.speed, required this.deg});

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}

@JsonSerializable()
class SysModel {
  final String pod;

  SysModel({required this.pod});

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);

  Map<String, dynamic> toJson() => _$SysModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final int id;
  final String name;
  final CoordModel coord;
  final String country;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
class CoordModel {
  final double lat;
  final double lon;

  CoordModel({required this.lat, required this.lon});

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordModelToJson(this);
}
