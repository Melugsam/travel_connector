import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_connector/core/exception/domain_exception.dart';
import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';

abstract class ProfileEditRepository {
  Future<Either<DomainException,ProfileEditEntity>> executeEdit(String? name, String? description, File? avatarFile);
}