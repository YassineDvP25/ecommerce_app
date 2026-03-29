import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class TopCurve extends StatelessWidget {
  const TopCurve({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220 * scale,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors2.surfaceDark, AppColors2.midGrey],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 26 * scale,
          decoration: const BoxDecoration(
            color: AppColors2.scaffoldBackgroundAlt,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
        ),
      ),
    );
  }
}
