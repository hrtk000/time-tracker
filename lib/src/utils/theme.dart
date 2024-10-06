// pretty colours

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 119, 178, 0); // Example color
  static const Color secondary = Color.fromARGB(255, 190, 173, 255); // Example color
  static const Color background = Color.fromARGB(255, 213, 255, 128); // Example color
  static const Color error = Color.fromRGBO(255, 195, 83, 1); // Example color
}

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 204, 255, 132)),
        useMaterial3: true,
);