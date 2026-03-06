import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/common_widgets/custom_button.dart';
import 'package:djarna/presentation/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Image.asset('assets/images/djarna_logo.png', height: 100.h),
              SizedBox(height: 48.h),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Access your premium marketplace',
                style: TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: 'Phone Number',
                hint:
                    'Enter your email', // Match the hint in mockup even if label says Phone
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  CustomTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    isPassword: true,
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                      color: Colors.black38,
                      size: 20.sp,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Forgot?',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.buttonPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Sign in',
                onPressed: () {},
                fontSize: 18.sp,
                height: 56.h,
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.black12)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'OR SIGN IN WITH',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.black12)),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialButton(
                    iconPath: 'assets/images/google_icon.png',
                  ), // Placeholder paths
                  SizedBox(width: 20.w),
                  _SocialButton(iconPath: 'assets/images/facebook_icon.png'),
                  SizedBox(width: 20.w),
                  _SocialButton(iconPath: 'assets/images/apple_icon.png'),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String iconPath;
  const _SocialButton({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.star,
          size: 24.sp,
          color: Colors.grey,
        ), // Placeholder for actual icons
      ),
    );
  }
}
