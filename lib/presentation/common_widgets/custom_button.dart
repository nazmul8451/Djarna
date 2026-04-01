import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.height,
    this.width = double.infinity,
    this.borderRadius,
    this.fontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 46.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.buttonPrimary,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: textColor,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize ?? AppTypography.h2,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
