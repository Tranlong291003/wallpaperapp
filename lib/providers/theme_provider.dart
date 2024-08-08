import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/apps/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider() : _themeData = lightMode {
    _loadThemeMode();
  }

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _saveThemeMode();
    _updateSystemUiOverlayStyle(); // Cập nhật màu thanh điều hướng
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode');

    if (isDarkMode == null) {
      // Nếu chưa có giá trị trong SharedPreferences, sử dụng giao diện của thiết bị
      final isSystemDarkMode =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      _themeData = isSystemDarkMode ? darkMode : lightMode;
      await prefs.setBool('isDarkMode', isSystemDarkMode);
    } else {
      _themeData = isDarkMode ? darkMode : lightMode;
    }

    _updateSystemUiOverlayStyle(); // Cập nhật màu thanh điều hướng
    notifyListeners();
  }

  Future<void> _saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _themeData == darkMode);
  }

  void _updateSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            _themeData.scaffoldBackgroundColor, // Màu của thanh điều hướng
        systemNavigationBarIconBrightness: _themeData.brightness ==
                Brightness.dark
            ? Brightness.light
            : Brightness.dark, // Độ sáng của biểu tượng trên thanh điều hướng
      ),
    );
  }
}
