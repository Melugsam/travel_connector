import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/repository/follow_repository.dart';

class FollowUseCase {
  final FollowRepository _followRepository;

  FollowUseCase(this._followRepository);

  Future<Either<DomainException, void>> call(
      int targetUserId) async {
    return await _followRepository.follow(targetUserId);
  }
}
