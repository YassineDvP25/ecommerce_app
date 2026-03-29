import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors2.black,
          ),
        ),
        const Text(
          "See All",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
