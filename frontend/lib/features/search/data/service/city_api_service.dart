import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/city_response_model.dart';

part 'city_api_service.g.dart';

@RestApi(baseUrl: "https://city-search2.p.rapidapi.com")
abstract class CityApiService {
  factory CityApiService(Dio dio, {String baseUrl}) = _CityApiService;

  @GET("/city/autocomplete?input={input}&countryCode=RU")
  Future<CityResponseModel> fetchCity(
      @Path("input") String input,
      @Header("x-rapidapi-key") String apiKey,
      @Header("x-rapidapi-host") String apiHost,
      );
}