import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/search/data/model/weather_response_model.dart';
import 'package:travel_connector/features/search/data/service/weather_api_service.dart';

class WeatherRemoteDataSource extends BaseRemoteDataSource {
  final WeatherApiService _weatherApiService;

  WeatherRemoteDataSource(
      LoggingService loggingService, this._weatherApiService) : super(loggingService: loggingService,);

  Future<Either<DataException, WeatherResponseModel>> fetchWeather(
    double latitude,
    double longitude,
  ) async {
    return safeApiCall(
      () => _weatherApiService.fetchWeather(
        latitude,
        longitude,
        rapidApiKey,
        weatherApiHost,
      ),
    );
  }
}
