import 'package:flutter/material.dart';

class AuthTextFields extends StatefulWidget {
  final bool showEmail;
  const AuthTextFields({super.key, this.showEmail = false});

  @override
  State<AuthTextFields> createState() => _AuthTextFieldsState();
}

class _AuthTextFieldsState extends State<AuthTextFields> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
  );

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            prefixIcon: const Icon(Icons.person, color: Colors.black54),
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
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
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
        if (widget.showEmail) ...[
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Colors.black54,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border.copyWith(
                borderSide: BorderSide(color: Colors.blue.shade200, width: 1.5),
              ),
            ),
          ),
        ],
        const SizedBox(height: 16),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone, color: Colors.black54),
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
        const SizedBox(height: 16),
        TextField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
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
                _obscureConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
