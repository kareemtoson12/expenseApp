import 'package:expense/presentation/auth/login/widgets/login_button.dart';
import 'package:flutter/material.dart';

import 'package:expense/presentation/auth/login/widgets/login_header.dart';
import 'package:expense/presentation/auth/login/widgets/login_text_fields.dart';
import 'package:expense/presentation/auth/login/widgets/forgot_password.dart';
import 'package:expense/presentation/auth/login/widgets/social_button.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/app/routing/routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    //responsive design
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //login header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [LoginHeader(width: width, height: height)],
              ),
              const SizedBox(height: 32),
              //text fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: LoginTextFields(),
              ),
              const SizedBox(height: 32),
              //loginButton
              LoginButton(
                text: 'LOGIN',
                onPressed: () {
                  // Handle login action
                },
                width: width * 0.9,
                height: 48,
              ),
              // Forgot password
              ForgotPassword(
                onTap: () {
                  // Handle forgot password
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Or', style: AppTextStyles.registerText),
              ),

              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    SocialButton(
                      icon: Image.asset(
                        'assets/png/google.png',
                        width: 24,
                        height: 24,
                      ),
                      text: 'CONTINUE WITH GOOGLE',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    SocialButton(
                      icon: Image.asset(
                        'assets/png/apple.png',
                        width: 24,
                        height: 24,
                      ),
                      text: 'CONTINUE WITH APPLE',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.registerText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signup);
                    },
                    child: Text(
                      'Register here',
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
