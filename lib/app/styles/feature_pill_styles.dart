import 'package:flutter/material.dart';

class FeaturePillStyles {
  static const double pillHeight = 70;
  static const double pillWidth = 135;
  static const double pillBorderRadius = 18;
  static const EdgeInsets pillPadding = EdgeInsets.symmetric(horizontal: 20);

  static const Color pillBackground = Colors.white;
  static const LinearGradient pillGradient = LinearGradient(
    colors: [
      Color(0xFF0057FF),
      Color(0xFF0057FF),
      Color(0xFF0057FF),
      Color(0xFF3A8DFF),

      Color(0xFF3A8DFF),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const Color iconColor = Color(0xFF1E6FF9);
  static const Color iconColorSelected = Colors.white;
  static const double iconSize = 20;

  static const Color textColor = Colors.black87;
  static const Color textColorSelected = Colors.white;
  static const double textFontSize = 17;
  static const FontWeight textFontWeight = FontWeight.w600;

  // Indicator
  static const double indicatorHeight = 6;
  static const double indicatorWidth = 42;
  static const double indicatorRadius = 3;
  static const Color indicatorColor = Color(0xFF1E6FF9);
  static const Color indicatorInactive = Color(0xFFE0E3EB);
}
