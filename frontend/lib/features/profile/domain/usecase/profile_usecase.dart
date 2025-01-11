import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  Future<Either<DomainException, ProfileEntity>> call(
      int postId, int targetUserId) async {
    try {
      final result = await _profileRepository.fetchProfile(
        postId,
        targetUserId
      );
      return Right(result);
    } on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(GenericDomainException("Неизвестная ошибка"));
    }
  }
}