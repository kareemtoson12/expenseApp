import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFFFFF); // Background
  static const Color primaryDark = Color(0xFF23272F); // Main text
  static const Color blue = Color(0xFF0057FF); // Progress indicator
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF2196F3),
      Color(0xFF2196F3),
      Color(0xFF0057FF),
      Color(0xFF0057FF),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  // Add more colors as needed
}
