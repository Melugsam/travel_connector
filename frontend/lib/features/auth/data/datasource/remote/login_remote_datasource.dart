import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/login_request_model.dart';
import 'package:travel_connector/features/auth/data/service/login_api_service.dart';

class LoginRemoteDataSource extends BaseRemoteDataSource {
  final LoginApiService _loginApiService;

  LoginRemoteDataSource(LoggingService loggingService, this._loginApiService)
      : super(loggingService: loggingService);

  Future<Either<DataException, AuthResponseModel>> login(
      LoginRequestModel requestModel) async {
    return safeApiCall(
      () => _loginApiService.executeLogin(requestModel),
    );
  }
}
