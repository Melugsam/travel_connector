import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/features/search/data/model/weather_response_model.dart';
import 'package:travel_connector/features/search/data/service/weather_api_service.dart';

class WeatherRemoteDataSource {
  final WeatherApiService _weatherApiService;

  WeatherRemoteDataSource(this._weatherApiService);

  Future<WeatherResponseModel> fetchWeather(
    double latitude,
    double longitude,
  ) async {
    try {
      final response = await _weatherApiService.fetchWeather(
        latitude,
        longitude,
        rapidApiKey,
        weatherApiHost,
      );
      return response;
    } on DioException {
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
