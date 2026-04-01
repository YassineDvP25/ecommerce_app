import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/core/theme/app_assets.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppAssets.loading, width: 150, height: 150),
    );
  }
}