import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<DomainException,AccessEntity>> call(String email, String password) async {
    return _loginRepository.executeLogin(email,password);
  }
}