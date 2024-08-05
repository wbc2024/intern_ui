import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  static Future setValue(String _keyName, String _keyValue) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(_keyName, _keyValue);
  }

  static Future<String?> getValue(String _keyName) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(_keyName);
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
