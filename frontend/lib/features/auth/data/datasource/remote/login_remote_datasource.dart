import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/model/server_error_model.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/login_request_model.dart';
import 'package:travel_connector/features/auth/data/service/login_api_service.dart';

class LoginRemoteDataSource {
  final LoginApiService _loginApiService;

  LoginRemoteDataSource(this._loginApiService);

  Future<AuthResponseModel> login(LoginRequestModel requestModel) async {
    try {
      final response = await _loginApiService.fetchLogin(requestModel);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          serverError: ServerErrorModel.fromJson(e.response!.data)
        );
      }
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}