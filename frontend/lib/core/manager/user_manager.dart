import 'package:travel_connector/core/constant/storage_keys.dart';
import 'package:travel_connector/core/service/local_database_service.dart';

import 'session_manager.dart';

class UserManager {
  final LocalDatabaseService _localDatabase;
  final SessionManager _sessionManager;

  UserManager(this._localDatabase, this._sessionManager);

  Future<int> getUserId() async {
    final userId = _localDatabase.read<int>(userIdKey);
    if (userId == null) {
      _sessionManager.handleSessionExpired("Срок сессии истёк");
      throw Exception("Срок сессии истёк");
    }
    return userId;
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
