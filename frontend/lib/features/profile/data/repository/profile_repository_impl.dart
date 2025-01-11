import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_mapper.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileMapper _profileMapper;
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepositoryImpl(
      this._profileRemoteDataSource,
      this._profileMapper,
      );

  @override
  Future<ProfileEntity> fetchProfile(
      int postId, int targetUserId) async {
    try {
      final response = await _profileRemoteDataSource.fetchProfile(
          postId,
        targetUserId
      );
      return _profileMapper.mapToEntity(response);
    } on ServerException catch (e) {
      if (e.serverError.errorCode == 401) {
        throw UnauthorizedException();
      } else if (e.serverError.errorCode == 403) {
        throw PermissionDeniedException();
      } else {
        throw GenericDomainException(e.serverError.details);
      }
    } on NetworkException {
      throw GenericDomainException(
          "Ошибка сети. Проверьте подключение к интернету.");
    } catch (e) {
      throw GenericDomainException(
          "Произошла неизвестная ошибка. Попробуйте позже.");
    }
  }
}