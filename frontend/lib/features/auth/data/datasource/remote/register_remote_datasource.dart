import 'package:dio/dio.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/model/server_error_model.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/register_request_model.dart';
import 'package:travel_connector/features/auth/data/service/register_api_service.dart';

class RegisterRemoteDataSource {
  final RegisterApiService _loginApiService;

  RegisterRemoteDataSource(this._loginApiService);

  Future<AuthResponseModel> register(RegisterRequestModel requestModel) async {
    try {
      final response = await _loginApiService.fetchRegister(requestModel);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
            serverError: ServerErrorModel.fromJson(e.response!.data));
      }
      throw NetworkException();
    } catch (e) {
      throw GenericDataSourceException();
    }
  }
}
