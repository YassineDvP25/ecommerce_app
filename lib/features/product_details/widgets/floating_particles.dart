import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class FloatingParticles extends StatelessWidget {
  const FloatingParticles({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(
          15,
          (index) => Positioned(
            top: Random().nextDouble() * 800,
            left: Random().nextDouble() * 400,
            child: AnimatedOpacity(
              opacity: 0.2,
              duration: const Duration(seconds: 2),
              child: Container(
                height: Random().nextDouble() * 6 + 2,
                width: Random().nextDouble() * 6 + 2,
                decoration: const BoxDecoration(
                  color: AppColors2.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
