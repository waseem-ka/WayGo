import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late final SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static Future<void> removeAll() async {
    await _prefs.clear();
  }
}
