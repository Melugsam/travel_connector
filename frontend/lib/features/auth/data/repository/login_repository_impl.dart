import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/login_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/mapper/user_mapper.dart';
import 'package:travel_connector/features/auth/data/model/auth_request_model.dart';
import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final UserMapper _userMapper;
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoggingService _loggingService;

  LoginRepositoryImpl(
    this._loggingService,
    this._loginRemoteDataSource,
    this._userMapper,
  );

  @override
  Future<UserEntity> fetchLogin(
      String email, String password) async {
    try {
      _loggingService.logInfo('test');
      final response = await _loginRemoteDataSource.login(
        AuthRequestModel(email: email, password: password),
      );
      return _userMapper.mapToEntity(response);
    } on ServerException catch (e) {
      if (e.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (e.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(e.serverError.details);
      }
    } on NetworkException {
      throw GenericDomainException("Ошибка сети. Проверьте подключение к интернету.");
    } catch (e) {
      throw GenericDomainException("Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}
