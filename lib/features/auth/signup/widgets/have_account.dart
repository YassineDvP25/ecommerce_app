import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account ? ",
          style: TextStyle(color: AppColors2.white70),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            AppRouter.navigateAndReplace(context, Routes.login);
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: AppColors2.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
