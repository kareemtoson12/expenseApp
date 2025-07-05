import 'package:flutter/material.dart';

class HomeCardStyles {
  static const double cardWidth = 150;
  static const double cardBorderRadius = 24;
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    vertical: 24,
    horizontal: 16,
  );

  static const double cardElevation = 1.0;

  static const Color cardShadowColor = Color(0x0A000000); // 4% opacity black
  static const double cardShadowBlur = 16;
  static const Offset cardShadowOffset = Offset(0, 8);

  static Color cardBackground = Colors.white.withOpacity(0.9);
  static const LinearGradient highlightedGradient = LinearGradient(
    colors: [
      Color(0xFF1E6FF9),
      Color(0xFF3A8DFF),
      Color(0xFF0057FF),
      Color(0xFF0057FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Icon styles
  static const Color iconColor = Colors.black54;
  static const Color iconColorHighlighted = Colors.white;
  static const double iconSize = 32;
  static const double amountIconSize = 20;

  // Text styles
  static const Color textColor = Colors.black87;
  static const Color textColorHighlighted = Colors.white;
  static const double titleFontSize = 16;
  static const FontWeight titleFontWeight = FontWeight.w500;
  static const double amountFontSize = 22;
  static const FontWeight amountFontWeight = FontWeight.bold;

  // Spacing
  static const double iconTextSpacing = 16;
  static const double textAmountSpacing = 16;
}
