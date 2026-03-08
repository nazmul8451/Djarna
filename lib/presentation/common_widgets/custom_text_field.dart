import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final Color? fillColor;
  final bool showLabel;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.borderRadius,
    this.fillColor,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: TextStyle(
              fontSize: AppTypography.bodyMedium,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          cursorColor: AppColors.buttonPrimary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: AppTypography.bodyMedium,
              color: Colors.black38,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: BorderSide(
                color: AppColors.buttonPrimary.withOpacity(0.1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: const BorderSide(
                color: AppColors.buttonPrimary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
            filled: true,
            fillColor: fillColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
