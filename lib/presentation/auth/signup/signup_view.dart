import 'package:flutter/material.dart';
import 'package:expense/presentation/auth/widgets/auth_header.dart';
import 'package:expense/presentation/auth/widgets/auth_text_fields.dart';
import 'package:expense/presentation/auth/signup/widgets/signup_button.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/app/routing/routes.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AuthHeader(width: width, height: height)],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: AuthTextFields(showEmail: true),
              ),
              const SizedBox(height: 32),
              SignupButton(
                text: 'SIGN UP',
                onPressed: () {
                  // Handle signup action
                },
                width: width * 0.9,
                height: 48,
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyles.registerText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    child: Text(
                      'Login here',
                      style: AppTextStyles.registerLink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
