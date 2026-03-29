import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class GlassCard extends StatelessWidget {
  final Widget child;

  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors2.white.withOpacity(.08),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors2.white.withOpacity(.2)),
          ),
          child: child,
        ),
      ),
    );
  }
}
