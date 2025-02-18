import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/register_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/mapper/access_mapper.dart';
import 'package:travel_connector/features/auth/data/model/register_request_model.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource _loginRemoteDataSource;
  final AccessMapper _accessMapper;
  final ErrorHandler _errorHandler;

  RegisterRepositoryImpl(
    this._loginRemoteDataSource,
    this._accessMapper,
    this._errorHandler,
  );

  @override
  Future<Either<DomainException,AccessEntity>> executeRegister(
      String name, String email, String password) async {
    final result = await _loginRemoteDataSource.register(
      RegisterRequestModel(name: name, email: email, password: password),
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
