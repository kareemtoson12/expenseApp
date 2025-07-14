import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFFFFF); // Background
  static const Color accent = Color(0xFF23272F); // Main text
  static const Color background = Color(0xFFF6F7FB);
  static const Color text = Color(0xFF222B45);
  static const Color grey = Color(0xFF8F92A1);
  static Color primaryDark = Color(0xFF222B45);
  static const Color blue = Color(0xFF0057FF);

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

  static const LinearGradient scaffoldGradient = LinearGradient(
    colors: [
      Color(0xFF2196F3), // blue
      Color(0xFFFFFFFF), // white
      Color(0xFFFFFFFF), // white
      Color(0xFFFFFFFF), // white
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
