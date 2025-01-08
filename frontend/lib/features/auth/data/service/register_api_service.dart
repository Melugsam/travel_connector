import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/register_request_model.dart';

part 'register_api_service.g.dart';

@RestApi()
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST('/auth/register')
  Future<AuthResponseModel> fetchRegister(@Body() RegisterRequestModel request);
}