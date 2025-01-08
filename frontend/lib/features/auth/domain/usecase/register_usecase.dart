import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';
import 'package:travel_connector/features/auth/domain/repository/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  Future<Either<DomainException,UserEntity>> call(String name, String email, String password) async {
    try{
      final result = await _registerRepository.fetchRegister(name, email, password);
      return Right(result);
    }on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericDomainException("Неизвестная ошибка"));
    }
  }
}