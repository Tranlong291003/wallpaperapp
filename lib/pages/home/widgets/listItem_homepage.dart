import 'package:flutter/material.dart';
import 'package:wallpaper/controllers/favorite_Controler.dart';

Widget listItem_HomePage(FavoriteController favoriteController,
    void Function(int index) onFavoriteToggle) {
  return GridView.builder(
    padding: const EdgeInsets.only(right: 30, left: 30),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Number of columns
      crossAxisSpacing: 10, // Spacing between columns
      mainAxisSpacing: 10, // Spacing between rows
      childAspectRatio: 153 / 243, // Tỉ lệ kích thước của mỗi item
    ),
    itemCount: 20, // Number of items in the grid
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
                    onFavoriteToggle(index);
                  },
                  child: Icon(
                    favoriteController.favoriteStatus[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 30,
                    color: favoriteController.favoriteStatus[index]
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
  );
}
