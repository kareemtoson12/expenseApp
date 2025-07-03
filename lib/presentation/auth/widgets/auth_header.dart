import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expense/app/styles/text_styles.dart';

class AuthHeader extends StatelessWidget {
  final double width;
  final double height;
  const AuthHeader({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.02),
        SvgPicture.asset(
          'assets/svg/logo.svg',
          width: width * 0.1,
          height: height * 0.135,
          fit: BoxFit.contain,
        ),
        Text('monex', style: AppTextStyles.splashTitleStyle(width * 0.6)),
      ],
    );
  }
}
