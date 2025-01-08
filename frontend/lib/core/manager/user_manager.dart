import 'package:travel_connector/core/constant/storage_keys.dart';
import 'package:travel_connector/core/service/local_database.dart';

class UserManager {
  final LocalDatabase _localDatabase;

  UserManager(this._localDatabase);

  Future<int?> getUserId() async {
    try {
      return _localDatabase.read<int>(userIdKey);
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUserId(int userId) async {
    try {
      await _localDatabase.write<int>(userIdKey, userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearUserId() async {
    try {
      await _localDatabase.remove(userIdKey);
    } catch (e) {
      rethrow;
    }
  }
}
