import 'package:ecommerce/features/auth/login/widgets/custom_submit_btn.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback onLoginPressed; // Pass the full login logic

  const LoginButton({
    super.key,
    required this.formKey,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSubmitBtn(
      text: 'Login',
      onPressed: () async {
        if (!formKey.currentState!.validate()) return;
        onLoginPressed();
      },
    );
  }
}
