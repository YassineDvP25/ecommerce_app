import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../../core/theme/colors.dart';

class CustomSubmitBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool enabled;

  const CustomSubmitBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      duration: const Duration(milliseconds: 800),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          onPressed: enabled && !isLoading ? onPressed : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors2.white, // 👈 مهم

            backgroundColor: AppColors2.transparent,
            shadowColor: AppColors2.blackHard.withOpacity(0.3),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child:
              !isLoading
                  ? Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors2.black, AppColors2.charcoal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors2.white,
                        fontFamily: 'SofiaSans',
                      ),
                    ),
                  )
                  : SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors2.textOnPrimary,
                      ),
                    ),
                  ),
        ),
      ),
    );
  }
}
