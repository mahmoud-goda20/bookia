import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences prefs;
  static String tokenkey = 'token';
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static cacheData(String key, dynamic value) {
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  static getCachedData(String key) {
    return prefs.get(key);
  }

  static removeCachedData(String key) {
    prefs.remove(key);
  }
}
