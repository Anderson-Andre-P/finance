import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF0178F1);
  static const Color secondary = Color(0xFF0B2161);

  static const List<Color> greenGradient = [
    primary,
    secondary,
  ];

  static const List<Color> greyGradient = [
    Colors.grey,
    Color(0xFF818181),
  ];

  static const Color white = Colors.white;
  static const Color scaffold = Color.fromARGB(255, 242, 245, 248);

  static const Color greyLight = Color(0xFF444444);
}
