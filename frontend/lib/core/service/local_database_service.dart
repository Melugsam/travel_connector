import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabaseService {
  final SharedPreferences _sharedPreferences;

  LocalDatabaseService(this._sharedPreferences);

  T? read<T>(String key) {
    return _sharedPreferences.get(key) as T?;
  }

  Future write<T>(String key, T value) {
    if (value is bool) {
      return _sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return _sharedPreferences.setDouble(key, value);
    } else if (value is String) {
      return _sharedPreferences.setString(key, value);
    } else if (value is List<String>) {
      return _sharedPreferences.setStringList(key, value);
    } else {
      throw Exception('Некорретный тип данных');
    }
  }

  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }
}
