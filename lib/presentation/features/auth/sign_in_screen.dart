import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_strings.dart';
import 'package:djarna/core/routes/app_routes.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/djarna_logo.png',
                height: 200.h,
                width: 200.w,
              ),
              SizedBox(height: 8.h),
              const Text(
                AppStrings.login,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.accessMarketplace,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                label: AppStrings.phoneNumber,
                hint: AppStrings.enterPhoneNumber,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  const CustomTextField(
                    label: AppStrings.password,
                    hint: AppStrings.enterPassword,
                    isPassword: true,
                    suffixIcon: Icon(
                      Icons.visibility_outlined,
                      color: Colors.black38,
                      size: 20,
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
                        AppStrings.forgotPassword,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.buttonPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: AppStrings.login,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.custom_bottom_bar),
                fontSize: 18,
                height: 56,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.black12)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppStrings.orSignInWith,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.black12)),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _SocialButton(
                    iconPath: 'assets/images/google_icon.png',
                  ),
                  const SizedBox(width: 20),
                  const _SocialButton(
                    iconPath: 'assets/images/logos_facebook.png',
                  ),
                  const SizedBox(width: 20),
                  const _SocialButton(iconPath: 'assets/images/apple_icon.png'),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.sign_up,
                      );
                    },
                    child: Text(
                      AppStrings.createAccount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
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
      width: 56,
      height: 56,
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
        child: Image.asset(
          iconPath,
          height: 24,
          width: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
