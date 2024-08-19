import 'package:flutter/material.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
import 'package:wallpaper/apps/utils/search.dart';
import 'package:wallpaper/pages/categories/widgets/listItem_Category.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          search(context),
          listItem_Category(),
        ],
      ),
    );
  }
}
