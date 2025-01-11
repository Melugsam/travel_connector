import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/profile/data/model/profile_edit_request_model.dart';
import 'package:travel_connector/features/profile/data/model/profile_edit_response_model.dart';

part 'profile_edit_api_service.g.dart';

@RestApi()
abstract class ProfileEditApiService {
  factory ProfileEditApiService(Dio dio, {String baseUrl}) = _ProfileEditApiService;

  @POST('/profile/edit')
  Future<ProfileEditResponseModel> fetchProfileEdit(@Body() ProfileEditRequestModel request);
}