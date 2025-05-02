import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/search/data/model/places_response_model.dart';
import 'package:travel_connector/features/search/data/service/places_api_service.dart';

class PlacesRemoteDataSource extends BaseRemoteDataSource {
  final PlacesApiService _placesApiService;

  PlacesRemoteDataSource(this._placesApiService)
      : super(
        );

  Future<Either<DataException, PlacesResponseModel>> fetchPlaces(
    double latitude,
    double longitude,
    String keyword,
  ) async {
    return safeApiCall(
      () => _placesApiService.fetchPlaces(
        latitude,
        longitude,
        keyword,
        rapidApiKey,
        placesApiHost,
      ),
    );
  }
}
