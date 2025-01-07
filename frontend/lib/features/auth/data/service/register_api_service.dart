import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:travel_connector/features/auth/data/model/auth_request_model.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';

part 'register_api_service.g.dart';

@RestApi()
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST('/register')
  Future<AuthResponseModel> fetchRegister(@Body() AuthRequestModel request);
}