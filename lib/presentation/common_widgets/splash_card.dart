import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashCardWidget extends StatelessWidget {
  const SplashCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(24.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: AppTypography.h1,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                  children: [
                    const TextSpan(text: 'Welcome to '),
                    TextSpan(
                      text: 'Djarna',
                      style: TextStyle(color: AppColors.buttonPrimary),
                    ),
                    const TextSpan(text: ' app'),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Discover great deals, trusted sellers, and items you\'ll love—all in one place.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppTypography.bodySmall,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 46.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: AppTypography.h2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: AppTypography.bodySmall,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
