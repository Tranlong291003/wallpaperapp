import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageDecoration introductionCustom() {
  return const PageDecoration(
    imageFlex: 3,
    imagePadding: EdgeInsets.only(top: 25),
    titleTextStyle: TextStyle(
      fontSize: 25,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
    bodyTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
    ),
  );
}
