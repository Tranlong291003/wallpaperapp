import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    onPrimary: Color(0xFFF3F3F3),
    primaryContainer: Color(0xFFF1F4FF),
    secondary: Color(0xFF001A72),
    onSecondary: Color(0xFF001A72),
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      onPrimary: Color(0xFF1F1F1F),
      primaryContainer: Color(0xFF545454),
      secondary: Color(0xFF00E809),
      onSecondary: Colors.white),
);
