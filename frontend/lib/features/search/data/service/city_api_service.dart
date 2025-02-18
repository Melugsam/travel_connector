import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/city_response_model.dart';

part 'city_api_service.g.dart';

@RestApi(baseUrl: "https://api.geoapify.com/v1/geocode")
abstract class CityApiService {
  factory CityApiService(Dio dio, {String baseUrl}) = _CityApiService;

  @GET("/autocomplete")
  Future<CityResponseModel> fetchCity(
      @Query("text") String cityName,
      @Query("apiKey") String apiKey,
      );
}