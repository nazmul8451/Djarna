import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});


  static const String name = "/product-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildAppBar()
              ],
            
              
            ),
          ),
        ),
      ),
    );
  }
}




//-------------------------------------------------
 Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/drawer_icon.png', width: 24.w, height: 24.h),
        Image.asset(
          'assets/images/djarna_logo.png',
          height: 40.h,
          width: 70.w,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.shopping_bag,
            size: 40.h,
            color: AppColors.buttonPrimary,
          ),
        ),
        Stack(
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 28.sp,
              color: Colors.black87,
            ),
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFB58322),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }