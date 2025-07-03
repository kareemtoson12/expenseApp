import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model.dart';
import 'package:expense/app/styles/text_styles.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingPageData data;
  final double width;
  final double height;
  const OnboardingContent({
    super.key,
    required this.data,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          data.svgAsset,
          width: width * 0.9,
          height: height * 0.42,
          fit: BoxFit.contain,
        ),
        SizedBox(height: height * 0.06),
        Text(
          data.title,
          style: AppTextStyles.onboardingTitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.015),
        Text(
          data.subtitle,
          style: AppTextStyles.onboardingSubtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
