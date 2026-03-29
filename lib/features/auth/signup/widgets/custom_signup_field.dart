import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/theme/typography.dart';

class CustomSignupField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String?)? validator;

  const CustomSignupField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.suffix,
    this.validator,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
