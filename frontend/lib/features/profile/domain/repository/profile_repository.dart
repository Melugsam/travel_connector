import 'package:travel_connector/features/profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> fetchProfile(int userId, int targetUserId);
}