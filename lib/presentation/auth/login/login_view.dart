import 'package:expense/app/styles/app_colors.dart' show AppColors;
import 'package:expense/presentation/auth/login/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense/presentation/auth/login/widgets/login_header.dart';
import 'package:expense/presentation/auth/login/widgets/login_text_fields.dart';
import 'package:expense/presentation/auth/login/widgets/forgot_password.dart';
import 'package:expense/presentation/auth/login/widgets/social_button.dart';
import 'package:expense/presentation/auth/login/login_cubit.dart';
import 'package:expense/presentation/auth/login/login_state.dart';
import 'package:expense/domain/models/login_request_model.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/app/routing/routes.dart';
import 'package:expense/app/di/injection_container.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = sl<LoginCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginCubit.close();
    super.dispose();
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final request = LoginRequestModel(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    _loginCubit.login(request);
  }

  @override
  Widget build(BuildContext context) {
    //responsive design
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => _loginCubit,
      child: Scaffold(
        //  backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            height: height,
            decoration: BoxDecoration(gradient: AppColors.scaffoldGradient),
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.response.message),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                } else if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [LoginHeader(width: width, height: height)],
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: LoginTextFields(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                      ),
                      const SizedBox(height: 32),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          return LoginButton(
                            text: state is LoginLoading
                                ? 'LOGGING IN...'
                                : 'LOGIN',
                            onPressed: state is LoginLoading
                                ? null
                                : _handleLogin,
                            width: width * 0.9,
                            height: 48,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('Or', style: AppTextStyles.registerText),
                      ),
                      const SizedBox(height: 30),
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
            ),
          ),
        ),
      ),
    );
  }
}
