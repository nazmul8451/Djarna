import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/common_widgets/splash_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_img.png',
              fit: BoxFit.cover,
            ),
          ),
          SplashCardWidget(),
        ],
      ),
    );
  }
}

