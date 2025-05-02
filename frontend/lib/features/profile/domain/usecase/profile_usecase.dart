import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<Either<DomainException, ProfileEntity>> call(
     int? targetUserId) async {
    return await _profileRepository.fetchProfile(targetUserId);
  }
}
