import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/api_keys.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';
import 'package:travel_connector/features/search/data/service/hotel_api_service.dart';

class HotelRemoteDataSource {
  final HotelApiService _hotelApiService;

  HotelRemoteDataSource(this._hotelApiService);

  Future<HotelResponseModel> fetchHotel(
    double latitude,
    double longitude,
    String checkIn,
    String checkOut,
  ) async {
    try {
      final response = await _hotelApiService.fetchHotel(
        latitude,
        longitude,
        checkIn,
        checkOut,
        rapidApiKey,
        hotelApiHost,
      );
      return response;
    } on DioException {
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
