import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
import 'package:wallpaper/apps/utils/bottonNavigation.dart';
import 'package:wallpaper/providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: const Center(
          child: Text('ho123123123me'),
        ),
      ),
    );
  }
}
