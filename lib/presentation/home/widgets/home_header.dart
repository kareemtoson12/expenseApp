import 'package:flutter/material.dart';
import 'package:expense/app/styles/text_styles.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationPressed;

  const HomeHeader({
    Key? key,
    required this.userName,
    this.onNotificationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Hello', style: AppTextStyles.onboardingTitle),
                  Text('  $userName', style: const TextStyle(fontSize: 20)),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  color: Color(0xFfFBBC05),
                  size: 40,
                ),
                onPressed: onNotificationPressed,
              ),
            ],
          ),
        ),

        Text(
          'Your available balance',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8F92A1),
          ),
        ),
      ],
    );
  }
}
