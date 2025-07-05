import 'package:flutter/material.dart';

class AuthTextFields extends StatefulWidget {
  final bool showEmail;
  final TextEditingController? nameController;
  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final TextEditingController? monthlyIncomeController;

  const AuthTextFields({
    super.key,
    this.showEmail = false,
    this.nameController,
    this.usernameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.confirmPasswordController,
    this.monthlyIncomeController,
  });

  @override
  State<AuthTextFields> createState() => _AuthTextFieldsState();
}

class _AuthTextFieldsState extends State<AuthTextFields> {
  late final TextEditingController _nameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _monthlyIncomeController;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
  );

  @override
  void initState() {
    super.initState();
    _nameController = widget.nameController ?? TextEditingController();
    _usernameController = widget.usernameController ?? TextEditingController();
    _emailController = widget.emailController ?? TextEditingController();
    _phoneController = widget.phoneController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
    _confirmPasswordController =
        widget.confirmPasswordController ?? TextEditingController();
    _monthlyIncomeController =
        widget.monthlyIncomeController ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.nameController == null) _nameController.dispose();
    if (widget.usernameController == null) _usernameController.dispose();
    if (widget.emailController == null) _emailController.dispose();
    if (widget.phoneController == null) _phoneController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    if (widget.confirmPasswordController == null)
      _confirmPasswordController.dispose();
    if (widget.monthlyIncomeController == null)
      _monthlyIncomeController.dispose();
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
        const SizedBox(height: 16),
        if (widget.monthlyIncomeController != null) ...[
          TextField(
            controller: _monthlyIncomeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Monthly Income',
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black54),
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
      ],
    );
  }
}
