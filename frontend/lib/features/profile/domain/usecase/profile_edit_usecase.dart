import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_edit_repository.dart';

class ProfileEditUseCase {
  final ProfileEditRepository _profileEditUseCase;

  ProfileEditUseCase(this._profileEditUseCase);

  Future<Either<DomainException, ProfileEditEntity>> call(
      int userId, String name, String description, File avatarFile) async {
    try {
      final result = await _profileEditUseCase.executeEdit(
        userId,
        name,
        description,
        avatarFile,
      );
      return Right(result);
    } on DomainException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        GenericDomainException("Неизвестная ошибка"),
      );
    }
  }
}
