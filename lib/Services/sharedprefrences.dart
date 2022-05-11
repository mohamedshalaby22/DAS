import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesStorage {
  static SharedPreferences? _prefs;
  static const String savedTokenKey = 'TOKEN';

  static Future<void> _getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static saveToken(String token) async {
    await _getInstance();
    await _prefs!.setString(savedTokenKey, token);
  }

  static Future<String> getSavedToken() async {
    await _getInstance();
    return _prefs!.getString(savedTokenKey) ?? '';
  }
}
