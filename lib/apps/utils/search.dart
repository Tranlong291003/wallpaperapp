import 'package:flutter/material.dart';

Padding search(BuildContext context, void Function(String) onSearchChanged) {
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
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 20),
        ),
        textInputAction: TextInputAction.search,
        onChanged:
            onSearchChanged, // Call the provided function when input changes
      ),
    ),
  );
}
