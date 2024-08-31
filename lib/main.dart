import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controllers/authentic_Controller.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';
import 'package:wallpaper/pages/my_app.dart';
import 'package:wallpaper/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
