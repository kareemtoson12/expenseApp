import 'package:flutter/material.dart';

class BottomNavStyles {
  static const double barHeight = 70;
  static const double fabSize = 75;
  static const double fabIconSize = 36;
  static const double iconSize = 28;
  static const double iconSpacing = 32;
  static const double barElevation = 18;
  static const double fabElevation = 8;
  static const double notificationDotSize = 10;

  static const Color barBackground = Colors.white;
  static const Color iconColor = Color(0xFFB0B6C3);
  static const Color iconColorActive = Color(0xFF1E6FF9);
  static const Color fabIconColor = Colors.white;
  static const Color notificationDot = Color(0xFFFF3B30);

  static const LinearGradient fabGradient = LinearGradient(
    colors: [Color(0xFF0E33F3), Color(0xFF2FDAFF)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
