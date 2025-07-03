import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle splashTitleStyle(double width) => TextStyle(
    fontSize: width * 0.12,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  static TextStyle get onboardingTitle => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );

  static TextStyle get onboardingSubtitle => const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );
}
