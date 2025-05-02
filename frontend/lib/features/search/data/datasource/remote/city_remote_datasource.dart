import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/search/data/model/city_response_model.dart';
import 'package:travel_connector/features/search/data/service/city_api_service.dart';

class CityRemoteDataSource extends BaseRemoteDataSource {
  final CityApiService _cityApiService;

  CityRemoteDataSource(this._cityApiService)
      : super();

  Future<Either<DataException, CityResponseModel>> fetchCity(
    String cityName,
  ) async {
    return safeApiCall(
      () => _cityApiService.fetchCity(
        cityName,
        geoapifyApiKey,
      ),
    );
  }
}
