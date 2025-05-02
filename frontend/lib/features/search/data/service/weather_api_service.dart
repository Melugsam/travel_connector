import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/weather_response_model.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: "https://open-weather13.p.rapidapi.com")
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET("/city/fivedaysforcast/{lat}/{lon}")
  Future<WeatherResponseModel> fetchWeather(
      @Path("lat") double latitude,
      @Path("lon") double longitude,
      @Header("x-rapidapi-key") String apiKey,
      @Header("x-rapidapi-host") String apiHost,
      );
}