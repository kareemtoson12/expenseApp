import 'package:expense/app/styles/app_colors.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/presentation/onboarding/model.dart';
import 'package:expense/presentation/onboarding/widgets/onboarding_content.dart';
import 'package:expense/presentation/onboarding/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense/app/routing/routes.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            // header logo widget
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
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];
                  return OnboardingContent(
                    data: page,
                    width: width,
                    height: height,
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
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
            SizedBox(height: height * 0.04),
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
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
