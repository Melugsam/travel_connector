import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/features/search/data/model/places_response_model.dart';
import 'package:travel_connector/features/search/data/service/places_api_service.dart';

class PlacesRemoteDataSource {
  final PlacesApiService _placesApiService;

  PlacesRemoteDataSource(this._placesApiService);

  Future<PlacesResponseModel> fetchPlaces(
    double latitude,
    double longitude,
    String keyword,
  ) async {
    try {
      final response = await _placesApiService.fetchPlaces(
        latitude,
        longitude,
        keyword,
        rapidApiKey,
        placesApiHost,
      );
      return response;
    } on DioException {
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
