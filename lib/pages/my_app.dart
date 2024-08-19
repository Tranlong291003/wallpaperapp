import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/apps/utils/bottonNavigation.dart';
import 'package:wallpaper/pages/introduction/introduction_page.dart';
import 'package:wallpaper/pages/login/login_page.dart';
import 'package:wallpaper/providers/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _seen = false;
  bool _isLoading = true;
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkInitialization();
  }

  Future<void> _checkInitialization() async {
    await _checkIfSeen();
    _checkAuthStatus();
  }

  Future<void> _checkIfSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _seen = prefs.getBool('seen') ?? false;
      _isLoading = false;
      print('Seen value: $_seen');
    });
  }

  void _checkAuthStatus() {
    _user = FirebaseAuth.instance.currentUser;
    setState(() {
      _isLoading = false; // Set loading to false once the check is complete
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while the async operations complete
    if (_isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    Widget defaultHome;
    if (_user != null) {
      defaultHome = const BottomNavigation();
    } else if (_seen) {
      defaultHome = const LoginPage();
    } else {
      defaultHome = const IntroductionPage();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: defaultHome,
    );
  }
}
