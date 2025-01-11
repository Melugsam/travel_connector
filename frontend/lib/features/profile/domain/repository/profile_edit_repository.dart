import 'dart:io';

import 'package:travel_connector/features/profile/domain/entity/profile_edit_entity.dart';

abstract class ProfileEditRepository {
  Future<ProfileEditEntity> executeEdit(int userId, String name, String description, File avatarFile);
}