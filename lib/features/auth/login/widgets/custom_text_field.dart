import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../../core/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSubmitted;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors2.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow:
              _focusNode.hasFocus
                  ? [
                    BoxShadow(
                      color: AppColors2.primary.withOpacity(0.3),
                      blurRadius: 20.r,
                      spreadRadius: 0,
                    ),
                  ]
                  : [
                    BoxShadow(
                      color: AppColors2.black.withOpacity(0.05),
                      blurRadius: 10.r,
                    ),
                  ],
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onFieldSubmitted: (_) => widget.onSubmitted?.call(),
          focusNode: _focusNode,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors2.textPrimary,
            fontFamily: 'SofiaSans',
          ),
          decoration: InputDecoration(
            labelText: widget.label?.tr(),
            hintText: widget.hint?.tr(),
            prefixIcon:
                widget.prefixIcon != null
                    ? Icon(
                      widget.prefixIcon,
                      color:
                          _focusNode.hasFocus
                              ? AppColors2.primary
                              : AppColors2.textSecondary,
                      size: 20.w,
                    )
                    : null,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors2.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors2.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors2.primary, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            filled: true,
            fillColor: AppColors2.white,
          ),
        ),
      ),
    );
  }
}
