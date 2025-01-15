import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/search/data/datasource/remote/weather_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/weather_mapper.dart';
import 'package:travel_connector/features/search/domain/entity/weather_entity.dart';
import 'package:travel_connector/features/search/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherMapper _weatherMapper;
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepositoryImpl(
    this._weatherRemoteDataSource,
    this._weatherMapper,
  );

  @override
  Future<WeatherEntity> fetchWeather(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await _weatherRemoteDataSource.fetchWeather(
        latitude,
        longitude,
      );
      return _weatherMapper.mapToEntity(response);
    } on ServerException catch (e) {
      if (e.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (e.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(e.serverError.details);
      }
    } on NetworkException {
      throw GenericDomainException(
          "Ошибка сети. Проверьте подключение к интернету.");
    } catch (e) {
      throw GenericDomainException(
          "Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}
