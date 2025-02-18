import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';
import 'package:travel_connector/features/search/domain/repository/weather_repository.dart';

class WeatherUseCase {
  final WeatherRepository _weatherRepository;

  WeatherUseCase(this._weatherRepository);

  Future<Either<DomainException, WeatherEntity>> call(
    double latitude,
    double longitude,
  ) async {
    return await _weatherRepository.fetchWeather(
        latitude,
        longitude
    );
  }
}
