import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
import 'package:wallpaper/apps/utils/search.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';
import 'package:wallpaper/pages/home/widgets/listItem_homepage.dart';
import 'widgets/listCategory_homepage.dart'; // Import AppBar tùy chỉnh của bạn

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FavoriteController _favoriteController = FavoriteController(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          search(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  listCategory_HomePage(),
                  const SizedBox(height: 20),
                  listItem_HomePage(_favoriteController, (index) {
                    setState(() {
                      _favoriteController.toggleFavorite(index);
                    });
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
