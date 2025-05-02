import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';

abstract class FollowRepository {
  Future<Either<DomainException,void>> follow(int targetUserId);
}
