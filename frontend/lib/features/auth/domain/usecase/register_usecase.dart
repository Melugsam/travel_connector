import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<Either<DomainException, AccessEntity>> call(
      String name, String email, String password) async {
    return _registerRepository.executeRegister(name, email, password);
  }
}
