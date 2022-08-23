import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'storage_manager.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    getThemeFromStorage();
  }

  Future<void> getThemeFromStorage() async {
    final String themeData =
        await _storageManager.readData('themeMode') as String;
    if (themeData == null) {
      themeMode = ThemeMode.system;
    } else if (themeData == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }

    valueSet = true;
    notifyListeners();
  }

  Future<void> setDarkMode() async {
    themeMode = ThemeMode.dark;
    await _storageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  Future<void> setLightMode() async {
    themeMode = ThemeMode.light;
    await _storageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  StorageManager get _storageManager => StorageManager();
  ThemeMode themeMode = ThemeMode.system;
  bool valueSet = false;

  Future<void> toggleThemeMode() async {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      if (brightness == Brightness.light) {
        await setDarkMode();
      } else {
        await setLightMode();
      }
    } else if (themeMode == ThemeMode.dark) {
      await setLightMode();
    } else if (themeMode == ThemeMode.light) {
      await setDarkMode();
    }
  }
}
