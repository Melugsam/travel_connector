import 'package:travel_connector/features/auth/domain/entity/user_entity.dart';

abstract class RegisterRepository {
  Future<UserEntity> fetchRegister(String name, String email, String password);
}