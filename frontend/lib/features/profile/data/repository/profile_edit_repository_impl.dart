import 'dart:io';

import 'package:travel_connector/core/exception/data_exception.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_edit_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_edit_mapper.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_edit_repository.dart';

class ProfileEditRepositoryImpl implements ProfileEditRepository {
  final ProfileEditMapper _profileMapper;
  final ProfileEditRemoteDataSource _profileRemoteDataSource;

  ProfileEditRepositoryImpl(
      this._profileRemoteDataSource,
      this._profileMapper,
      );

  @override
  Future<ProfileEditEntity> executeEdit(
      int userId, String name, String description, File avatarFile) async {
    try {
      final response = await _profileRemoteDataSource.executeEdit(
          userId,
          name,
        description,
        avatarFile
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