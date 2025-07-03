import 'package:expense/app/styles/app_colors.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/app/styles/button_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageData {
  final String svgAsset;
  final String title;
  final String subtitle;
  OnboardingPageData({
    required this.svgAsset,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    svgAsset: 'assets/svg/on1.svg',
    title: 'Note Down Expenses',
    subtitle: 'Daily note your expenses to\nhelp manage money',
  ),
  OnboardingPageData(
    svgAsset: 'assets/svg/on2.svg',
    title: 'Simple Money Management',
    subtitle: 'Get your notifications or alert\nwhen you do the over expenses',
  ),
  OnboardingPageData(
    svgAsset: 'assets/svg/on3.svg',
    title: 'Easy to Track and Analize',
    subtitle: "Tracking your expense help make sure\nyou don't overspend",
  ),
];

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentPage = 0;

  void _nextPage() {
    setState(() {
      if (_currentPage < onboardingPages.length - 1) {
        _currentPage++;
      } else {
        // TODO: Navigate to next screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final page = onboardingPages[_currentPage];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            // header logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: width * 0.05,
                  height: height * 0.05,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: width * 0.015),
                Text(
                  'monex',
                  style: AppTextStyles.splashTitleStyle(width * 0.5),
                ),
              ],
            ),
            SizedBox(height: height * 0.08),
            //onboarding image
            SvgPicture.asset(
              page.svgAsset,
              width: width * 0.9,
              height: height * 0.42,
              fit: BoxFit.contain,
            ),
            SizedBox(height: height * 0.06),
            Text(
              page.title,
              style: AppTextStyles.onboardingTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.015),
            Text(
              page.subtitle,
              style: AppTextStyles.onboardingSubtitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingPages.length, (index) {
                if (index == _currentPage) {
                  return Container(
                    width: 24,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                } else {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }
              }),
            ),
            SizedBox(height: height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: GradientButton(
                text: _currentPage == onboardingPages.length - 1
                    ? "LET'S GO"
                    : "NEXT",
                onPressed: _nextPage,
                width: double.infinity,
                height: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
