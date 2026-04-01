import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FashionCategoryScreen extends StatelessWidget {
  const FashionCategoryScreen({super.key});

  static const String name = '/fashion-category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.sp,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'FASHION',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: _buildCategoryCard(
                context,
                title: 'WOMEN',
                image: 'assets/images/yellow_silk.png',
                onTap: () => Navigator.pushNamed(
                  context,
                  '/sub-category',
                  arguments: 'Women\'s Fashion',
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: _buildCategoryCard(
                context,
                title: 'MEN',
                image: 'assets/images/seller_img.png',
                onTap: () => Navigator.pushNamed(
                  context,
                  '/sub-category',
                  arguments: 'Men\'s Fashion',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.r),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.darken,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
