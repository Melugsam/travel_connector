import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/login_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/model/login_request_model.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/login_repository.dart';

import '../mapper/access_mapper.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AccessMapper _accessMapper;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final ErrorHandler _errorHandler;

  LoginRepositoryImpl(
    this._loginRemoteDataSource,
    this._accessMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException,AccessEntity>> executeLogin(
      String email, String password) async {
    final result = await _loginRemoteDataSource.login(
      LoginRequestModel(email: email, password: password),
    );
    return result.fold(
          (failure) => Left(
        _errorHandler.handle(failure),
      ),
          (response) => Right(
            _accessMapper.mapToEntity(response),
      ),
    );
  }
}
