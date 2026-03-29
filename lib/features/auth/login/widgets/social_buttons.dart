import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../../core/theme/colors.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BounceInDown(
            duration: const Duration(milliseconds: 1000),
            child: _buildSocialButton(
              icon: Icons.g_mobiledata,
              label: 'Google',
              color: AppColors2.accentRed,
              onTap: () {},
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: BounceInDown(
            delay: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 1000),
            child: _buildSocialButton(
              icon: Icons.apple,
              label: 'Apple',
              color: AppColors2.black,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors2.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors2.black.withOpacity(0.1),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20.w, color: color),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors2.textPrimary,
                fontFamily: 'SofiaSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
