import 'package:flutter/material.dart';
import 'package:wallpaper/apps/utils/appBar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
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
        child: const Center(child: Text('Setting')),
      ),
    );
  }
}
