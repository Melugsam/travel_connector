import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<DomainException,ProfileEntity>> fetchProfile(int? targetUserId);
}