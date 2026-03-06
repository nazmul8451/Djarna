import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/common_widgets/custom_button.dart';
import 'package:djarna/core/constants/app_sizes.dart';
import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
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
              const SizedBox(height: 6),
              Text(
                'Discover great deals, trusted sellers, and items you\'ll love—all in one place.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppTypography.bodySmall,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.name);
                },
                borderRadius: 16,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignInScreen.name);
                },
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
