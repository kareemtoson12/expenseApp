import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense/presentation/auth/widgets/auth_header.dart';
import 'package:expense/presentation/auth/widgets/auth_text_fields.dart';
import 'package:expense/presentation/auth/signup/widgets/signup_button.dart';
import 'package:expense/presentation/auth/signup/signup_cubit.dart';
import 'package:expense/presentation/auth/signup/signup_state.dart';
import 'package:expense/domain/models/signup_request_model.dart';
import 'package:expense/app/styles/text_styles.dart';
import 'package:expense/app/routing/routes.dart';
import 'package:expense/app/di/injection_container.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late final SignUpCubit _signUpCubit;

  @override
  void initState() {
    super.initState();
    _signUpCubit = sl<SignUpCubit>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _signUpCubit.close();
    super.dispose();
  }

  void _handleSignUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    final request = SignUpRequestModel(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      gender: '0',
      password: _passwordController.text,
      passwordConfirmation: _confirmPasswordController.text,
    );

    _signUpCubit.signUp(request);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => _signUpCubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.response.message),
                    backgroundColor: Colors.green,
                  ),
                );
                // Navigate to home or login page
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              } else if (state is SignUpError) {
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
                      children: [AuthHeader(width: width, height: height)],
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: AuthTextFields(
                        showEmail: true,
                        nameController: _nameController,
                        usernameController: _usernameController,
                        emailController: _emailController,
                        phoneController: _phoneController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                      ),
                    ),
                    const SizedBox(height: 12),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return SignupButton(
                          text: state is SignUpLoading
                              ? 'SIGNING UP...'
                              : 'SIGN UP',
                          onPressed: state is SignUpLoading
                              ? null
                              : _handleSignUp,
                          width: width * 0.9,
                          height: 48,
                        );
                      },
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
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
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
          ),
        ),
      ),
    );
  }
}
