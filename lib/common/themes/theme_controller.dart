import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  final SecureStorage secureStorage;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeController(this.secureStorage);

  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    final theme = await secureStorage.getThemeMode();
    if (theme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      await secureStorage.setThemeMode(false);
    } else {
      _themeMode = ThemeMode.dark;
      await secureStorage.setThemeMode(true);
    }
    notifyListeners();
  }
}
