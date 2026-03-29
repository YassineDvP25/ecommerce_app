import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/typography.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: AppTypography.titleLarge),
        Text("See All", style: AppTypography.link),
      ],
    );
  }
}
