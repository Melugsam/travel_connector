import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_edit_repository.dart';

class ProfileEditUseCase {
  final ProfileEditRepository _profileEditUseCase;

  ProfileEditUseCase(this._profileEditUseCase);

  Future<Either<DomainException, ProfileEditEntity>> call(
      String? name, String? description, File? avatarFile) async {
    return await _profileEditUseCase.executeEdit(
      name,
      description,
      avatarFile,
    );
  }
}
