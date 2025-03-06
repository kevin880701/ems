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

  /// 設定是否為 Faker Data
  Future<void> setIsFakerData(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool("isFakerData", value);
  }

  /// 取得是否為 Faker Data，若未設定則回傳 false
  Future<bool> getIsFakerData() async {
    final prefs = await _prefs;
    return prefs.getBool("isFakerData") ?? false;
  }
}