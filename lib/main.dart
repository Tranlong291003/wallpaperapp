import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/pages/my_app.dart';
import 'package:wallpaper/providers/theme_provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
