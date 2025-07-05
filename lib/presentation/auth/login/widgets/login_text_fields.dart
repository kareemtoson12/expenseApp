import 'package:flutter/material.dart';

class LoginTextFields extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const LoginTextFields({
    super.key,
    this.emailController,
    this.passwordController,
  });

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _obscurePassword = true;

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
  );

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.emailController == null) _emailController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.person_outline, color: Colors.black54),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: BorderSide(color: Colors.blue.shade200, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.black54),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: BorderSide(color: Colors.blue.shade200, width: 1.5),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
