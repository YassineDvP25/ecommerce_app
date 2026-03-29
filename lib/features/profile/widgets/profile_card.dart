import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20 * scale,
        vertical: 18 * scale,
      ),
      decoration: BoxDecoration(
        color: AppColors2.white,
        borderRadius: BorderRadius.circular(22 * scale),
        boxShadow: [
          BoxShadow(
            color: AppColors2.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42 * scale,
            backgroundImage: Image.asset('assets/images/تنزيل (14).jpeg').image,
          ),
          SizedBox(height: 12 * scale),
          Text(
            "Yassine El Anssari",
            style: TextStyle(
              fontSize: 20 * scale,
              fontWeight: FontWeight.w700,
              color: AppColors2.black87,
            ),
          ),
          SizedBox(height: 6 * scale),
          Text(
            "yass24@gmail.com",
            style: TextStyle(
              fontSize: 14 * scale,
              color: AppColors2.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
