import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/network/base_remote_datasource.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/auth/data/model/auth_response_model.dart';
import 'package:travel_connector/features/auth/data/model/register_request_model.dart';
import 'package:travel_connector/features/auth/data/service/register_api_service.dart';

class RegisterRemoteDataSource extends BaseRemoteDataSource{
  final RegisterApiService _registerApiService;

  RegisterRemoteDataSource(this._registerApiService): super();

  Future<Either<DataException,AuthResponseModel>> register(RegisterRequestModel requestModel) async {
    return safeApiCall(
          () => _registerApiService.executeRegister(requestModel),
    );
  }
}
