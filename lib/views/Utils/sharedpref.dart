import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance = SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _instance;
  }

  SharedPreferencesManager._internal();

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  Future<void> writeString(String key, String value) async {
    final prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<String> readString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key).toString();
  }

  Future<void> writeInt(String key, int value) async {
    final prefs = await _prefs;
    prefs.setInt(key, value);
  }

  Future<int?> readInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<void> writeBool(String key, bool value) async {
    final prefs = await _prefs;
    prefs.setBool(key, value);
  }

  Future<bool?> readBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);
  }
}
