import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/features/search/data/model/city_response_model.dart';
import 'package:travel_connector/features/search/data/service/city_api_service.dart';

class CityRemoteDataSource {
  final CityApiService _cityApiService;

  CityRemoteDataSource(this._cityApiService);

  Future<CityResponseModel> fetchCity(
    String input,
  ) async {
    try {
      final response = await _cityApiService.fetchCity(
        input,
        rapidApiKey,
        cityApiHost,
      );
      return response;
    } on DioException {
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
