import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/login_request_model.dart';

part 'login_api_service.g.dart';

@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST('/auth/login')
  Future<AuthResponseModel> fetchLogin(@Body() LoginRequestModel request);
}