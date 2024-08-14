class FavoriteController {
  List<bool> favoriteStatus;

  FavoriteController(int itemCount)
      : favoriteStatus = List.generate(itemCount, (index) => false);

  void toggleFavorite(int index) {
    favoriteStatus[index] = !favoriteStatus[index];
  }
}
