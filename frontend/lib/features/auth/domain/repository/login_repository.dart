import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> fetchLogin(String email, String password);
}