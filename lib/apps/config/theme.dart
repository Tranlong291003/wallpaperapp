import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Colors.black,
    primaryContainer: Color(0xFFF1F4FF),
    secondary: Color(0xFF1F41BB),
    onSecondary: Color(0xFF1F41BB),
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      surface: Colors.black,
      primary: Colors.white,
      primaryContainer: Color(0xFF545454),
      secondary: Color(0xFF00E809),
      onSecondary: Colors.white),
);
