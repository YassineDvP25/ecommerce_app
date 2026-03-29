import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class TogglePassword extends StatelessWidget {
  final VoidCallback onTap;
  final bool obscure;

  const TogglePassword({super.key, required this.onTap, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        obscure ? Icons.visibility_off : Icons.visibility,
        color: AppColors2.white,
      ),
      onPressed: onTap,
    );
  }
}
