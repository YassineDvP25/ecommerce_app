import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/theme/typography.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: AppTypography.input,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.hint,
        prefixIcon: Icon(icon, color: AppColors2.white),
        suffixIcon: suffix,
        filled: true,
        fillColor: AppColors2.white.withOpacity(.05),
        errorStyle: AppTypography.error,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
