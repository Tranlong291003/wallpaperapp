import 'package:flutter/material.dart';

Align listCategory_HomePage() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              width: 120,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10, // Khoảng cách ngang giữa các item
          ),
          itemCount: 5, // Số lượng item trong ListView
          scrollDirection: Axis.horizontal, // Cuộn ngang
        ),
      ),
    ),
  );
}
