import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {}
  }

  Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dynamic obj = prefs.get(key);
    return obj;
  }

  Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
