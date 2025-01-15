import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/hotel_response_model.dart';

part 'hotel_api_service.g.dart';

@RestApi(baseUrl: "https://tripadvisor16.p.rapidapi.com")
abstract class HotelApiService {
  factory HotelApiService(Dio dio, {String baseUrl}) = _HotelApiService;

  @GET("/api/v1/hotels/searchHotelsByLocation?latitude={lat}&longitude={lon}&checkIn={checkIn}&checkOut={checkOut}&pageNumber=1&currencyCode=USD")
  Future<HotelResponseModel> fetchHotel(
      @Path("lat") double latitude,
      @Path("lon") double longitude,
      @Path("keyword") String checkIn,
      @Path("keyword") String checkOut,
      @Header("x-rapidapi-key") String apiKey,
      @Header("x-rapidapi-host") String apiHost,
      );
}