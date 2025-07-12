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
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  static TextStyle get onboardingSubtitle => const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle forgotPassword = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static const TextStyle socialButton = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle registerText = TextStyle(
    color: Colors.black54,
    fontSize: 15,
  );

  static const TextStyle registerLink = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static const TextStyle settingsItem = TextStyle(
    fontSize: 16,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
  );
}
