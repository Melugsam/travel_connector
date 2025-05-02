import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/auth/domain/entity/access_entity.dart';

abstract class LoginRepository {
  Future<Either<DomainException,AccessEntity>> executeLogin(String email, String password);
}