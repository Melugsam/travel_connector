import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';

part 'hotel_api_service.g.dart';

@RestApi(baseUrl: "https://tripadvisor16.p.rapidapi.com")
abstract class HotelApiService {
  factory HotelApiService(Dio dio, {String baseUrl}) = _HotelApiService;

  @GET("/api/v1/hotels/searchHotelsByLocation?pageNumber=1&currencyCode=USD")
  Future<HotelResponseModel> fetchHotel(
      @Query("latitude") double latitude,
      @Query("longitude") double longitude,
      @Query("checkIn") String checkIn,
      @Query("checkOut") String checkOut,
      @Header("x-rapidapi-key") String apiKey,
      @Header("x-rapidapi-host") String apiHost,
      );
}