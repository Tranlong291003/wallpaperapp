import 'package:flutter/material.dart';

Padding search(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: Image.asset(
            'assets/images/Icon/search.png',
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          hintText: 'Search WallTKL',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          border: InputBorder.none, // Removes the default border
          contentPadding: const EdgeInsets.only(left: 20),
        ),
        textInputAction:
            TextInputAction.search, // Changes the action button on the keyboard
        onChanged: (value) {
          // Handle text changes here
        },
      ),
    ),
  );
}
