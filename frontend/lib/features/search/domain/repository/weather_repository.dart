import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<DomainException,WeatherEntity>> fetchWeather(double latitude, double longitude);
}
