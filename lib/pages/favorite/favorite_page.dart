import 'package:flutter/material.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController _favoriteController = FavoriteController(20);

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              GridView.builder(
                padding: const EdgeInsets.only(right: 30, left: 30),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 153 / 243,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _favoriteController.toggleFavorite(index);
                                });
                              },
                              child: Icon(
                                _favoriteController.favoriteStatus[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 30,
                                color: _favoriteController.favoriteStatus[index]
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
