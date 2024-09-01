import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/apps/utils/appBar.dart';
import 'package:wallpaper/apps/utils/search.dart';
import 'package:wallpaper/controllers/API_Controller.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';
import 'package:wallpaper/pages/details/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadPhotosIfNecessary();
  }

  Future<void> _loadPhotosIfNecessary() async {
    final favoriteController =
        Provider.of<FavoriteController>(context, listen: false);

    if (favoriteController.photos.isEmpty) {
      final api = PexelsApi();
      final photos = await api.fetchCuratedPhotos();
      favoriteController.setPhotos(photos);
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          search(context, _onSearchChanged),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<FavoriteController>(
              builder: (context, favoriteController, child) {
                final filteredPhotos = favoriteController.photos
                    .where((photo) =>
                        photo.alt.toLowerCase().contains(_searchQuery))
                    .toList();
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 153 / 243,
                  ),
                  itemCount: filteredPhotos.length,
                  itemBuilder: (context, index) {
                    final photo = filteredPhotos[index];
                    final photoIndex = favoriteController.photos.indexOf(photo);

                    return GestureDetector(
                      onTap: () {
                        // Điều hướng đến trang chi tiết
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoDetailPage(photo: photo),
                          ),
                        );
                      },
                      child: SizedBox(
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
                                    setState(() {
                                      favoriteController
                                          .toggleFavorite(photoIndex);
                                    });
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
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
