import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';

@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String cityName,
    required String country,
    required List<WeatherDetailEntity> weatherDetails,
  }) = _WeatherEntity;
}

@freezed
class WeatherDetailEntity with _$WeatherDetailEntity {
  const factory WeatherDetailEntity({
    required DateTime dateTime,
    required double temperature,
    required String description,
    required String icon,
  }) = _WeatherDetailEntity;
}
