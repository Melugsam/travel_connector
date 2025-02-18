import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_connector/core/constant/storage_keys.dart';

class TokenManager {
  final FlutterSecureStorage _secureStorage;

  TokenManager(this._secureStorage);

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: authTokenKey);
  }

  Future<void> saveAccessToken(String authToken) async {
    try {
      await _secureStorage.write(key: authTokenKey, value: authToken);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> clearAccessToken() async {
    try {
      await _secureStorage.delete(key: authTokenKey);
    } catch (e) {
      rethrow;
    }
  }
}
