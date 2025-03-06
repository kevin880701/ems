import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._privateConstructor();

  static final SharedPreferencesManager instance =
  SharedPreferencesManager._privateConstructor();

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> saveToken(String value) async {
    final prefs = await _prefs;
    await prefs.setString("token", value);
  }

  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString("token");
  }
}