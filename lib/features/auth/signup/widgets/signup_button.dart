import 'package:ecommerce/features/auth/login/widgets/custom_submit_btn.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomSubmitBtn(text: "Sign Up ", onPressed: onPressed);
  }
}
