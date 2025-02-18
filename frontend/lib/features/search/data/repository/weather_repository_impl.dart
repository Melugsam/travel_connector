import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/search/data/datasource/remote/weather_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/weather_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';
import 'package:travel_connector/features/search/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherMapper _weatherMapper;
  final WeatherRemoteDataSource _weatherRemoteDataSource;
  final ErrorHandler _errorHandler;

  WeatherRepositoryImpl(
    this._weatherRemoteDataSource,
    this._weatherMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException, WeatherEntity>> fetchWeather(
    double latitude,
    double longitude,
  ) async {
    final result = await _weatherRemoteDataSource.fetchWeather(
      latitude,
      longitude,
    );
    return result.fold(
      (failure) => Left(
        _errorHandler.handle(failure),
      ),
      (response) => Right(
        _weatherMapper.mapToEntity(response),
      ),
    );
  }
}
