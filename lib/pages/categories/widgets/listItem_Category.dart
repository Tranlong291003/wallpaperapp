import 'package:flutter/material.dart';

Expanded listItem_Category() {
  return Expanded(
    child: GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
      // Calculate childAspectRatio based on your desired item size
      childAspectRatio: 110 / 96, // width / height of your item
      children: List.generate(
        100,
        (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          );
        },
      ),
    ),
  );
}
