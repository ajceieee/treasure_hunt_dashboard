import 'package:shared_preferences/shared_preferences.dart';

import 'prefs.dart';

class SharedPrefsService extends PrefsService {
  static SharedPrefsService? _instance;

  static SharedPreferences? _preferences;

  static Future<SharedPrefsService> getInstance() async {
    if (_instance == null) {
      // Initialise the asynchronous shared preferences

      _preferences = await SharedPreferences.getInstance();
      _instance = SharedPrefsService();
    }

    return _instance!;
  }

  @override
  void saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }

  @override
  dynamic getFromDisk(String key) {
    var value = _preferences!.get(key);
    return value;
  }
}
