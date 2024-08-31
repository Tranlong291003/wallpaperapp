import 'package:flutter/material.dart';
import 'package:wallpaper/models/photo.dart';

class FavoriteController with ChangeNotifier {
  // List to hold all photos
  final List<Photo> _photos = [];

  // List to keep track of favorite statuses for each photo
  final List<bool> _favoriteStatus = [];

  // Getter to access the list of photos
  List<Photo> get photos => _photos;

  // Getter to access the favorite status list
  List<bool> get favoriteStatus => _favoriteStatus;

  // Method to set or update photos and initialize their favorite statuses
  void setPhotos(List<Photo> newPhotos) {
    _photos.clear();
    _photos.addAll(newPhotos);
    _favoriteStatus.clear();
    _favoriteStatus.addAll(List.generate(newPhotos.length, (index) => false));
    notifyListeners();
  }

  // Method to toggle the favorite status of a photo by index
  void toggleFavorite(int index) {
    if (index >= 0 && index < _favoriteStatus.length) {
      _favoriteStatus[index] = !_favoriteStatus[index];
      notifyListeners();
    }
  }

  // Method to get the list of favorite photos based on their favorite statuses
  List<Photo> getFavoritePhotos() {
    return _photos
        .asMap()
        .entries
        .where((entry) => _favoriteStatus[entry.key])
        .map((entry) => entry.value)
        .toList();
  }
}
