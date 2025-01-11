import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/profile/data/model/profile_request_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_response_model.dart';

part 'profile_api_service.g.dart';

@RestApi()
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @POST('/profile')
  Future<ProfileResponseModel> fetchProfile(@Body() ProfileRequestModel request);
}