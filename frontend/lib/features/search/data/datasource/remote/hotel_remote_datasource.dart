import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';
import 'package:travel_connector/features/search/data/service/hotel_api_service.dart';

class HotelRemoteDataSource extends BaseRemoteDataSource {
  final HotelApiService _hotelApiService;

  HotelRemoteDataSource(this._hotelApiService)
      : super();

  Future<Either<DataException, HotelResponseModel>> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  ) async {
    return safeApiCall(
      () => _hotelApiService.fetchHotel(
        latitude,
        longitude,
        checkIn,
        checkOut,
        rapidApiKey,
        hotelApiHost,
      ),
    );
  }
}
