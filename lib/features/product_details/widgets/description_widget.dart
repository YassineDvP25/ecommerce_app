import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors2.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 14,
          height: 1.6,
          color: AppColors2.black87,
        ),
      ),
    );
  }
}
