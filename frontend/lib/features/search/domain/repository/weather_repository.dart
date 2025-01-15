import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> fetchWeather(double latitude, double longitude);
}
