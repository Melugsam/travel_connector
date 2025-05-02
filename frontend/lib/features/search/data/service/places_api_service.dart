import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/search/data/model/places_response_model.dart';

part 'places_api_service.g.dart';

@RestApi(baseUrl: "https://google-map-places.p.rapidapi.com")
abstract class PlacesApiService {
  factory PlacesApiService(Dio dio, {String baseUrl}) = _PlacesApiService;

  @GET("/maps/api/place/nearbysearch/json?location={lat}%2C{lon}&radius=1000&language=ru&opennow=true&rankby=prominence")
  Future<PlacesResponseModel> fetchPlaces(
      @Path("lat") double latitude,
      @Path("lon") double longitude,
      @Query("keyword") String keyword,
      @Header("x-rapidapi-key") String apiKey,
      @Header("x-rapidapi-host") String apiHost,
      );
}