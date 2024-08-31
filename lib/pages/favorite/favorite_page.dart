import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';
import 'package:wallpaper/models/photo.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteController>(
      builder: (context, favoriteController, child) {
        // Filter out only the favorite photos
        final favoritePhotos = favoriteController.getFavoritePhotos();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorites'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: favoritePhotos.isEmpty
                ? const Center(child: Text('No favorites yet'))
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 153 / 243,
                    ),
                    itemCount: favoritePhotos.length,
                    itemBuilder: (context, index) {
                      final photo = favoritePhotos[index];
                      final photoIndex =
                          favoriteController.photos.indexOf(photo);

                      return SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple,
                            image: DecorationImage(
                              image: NetworkImage(photo.src.medium),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 15,
                                right: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    // Toggle favorite status
                                    favoriteController
                                        .toggleFavorite(photoIndex);
                                  },
                                  child: Icon(
                                    favoriteController
                                            .favoriteStatus[photoIndex]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                    color: favoriteController
                                            .favoriteStatus[photoIndex]
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
          ),
        );
      },
    );
  }
}
