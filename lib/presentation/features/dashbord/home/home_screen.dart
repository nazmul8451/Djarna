import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dynamic state for filtering
  String _selectedCategory = 'Tous';

  // Mock category data (this would come from an API later)
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Tous', 'count': '42', 'icon': Icons.grid_view_rounded},
    {'name': 'Vêtements', 'count': '42', 'icon': Icons.person_outline},
    {'name': 'Électronique', 'count': '12', 'icon': Icons.person_outline},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                _buildAppBar(),
                SizedBox(height: 25.h),
                _buildSearchSection(),
                SizedBox(height: 25.h),
                _buildCategorySection(),
                SizedBox(height: 25.h),
                _buildPromoBanner(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildSearchSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: CustomTextField(
              label: '',
              showLabel: false,
              hint: "Que recherchez-vous ?",
              borderRadius: 25.r,
              prefixIcon: const Icon(Icons.search, color: Colors.black38),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Container(
          height: 52.h,
          width: 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: AppColors.buttonPrimary.withOpacity(0.1)),
          ),
          child: const Icon(Icons.tune, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.map((cat) {
          final isSelected = _selectedCategory == cat['name'];
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = cat['name'];
                });
                // TODO: Trigger API filter search here
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.buttonPrimary : Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.buttonPrimary.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ]
                      : [],
                ),
                child: Row(
                  children: [
                    Icon(
                      cat['icon'],
                      color: isSelected ? Colors.white : Colors.black54,
                      size: 18,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      cat['name'].toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white.withOpacity(0.3)
                            : AppColors.chipGrey,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        cat['count'].toString(),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textGrey,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/home_card_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          gradient: LinearGradient(
            colors: [
              AppColors.bannerRed.withOpacity(0.9),
              AppColors.bannerOrange.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Jusqu'à ",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "-50%",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFCC00),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Sur toute la collection été",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.bannerRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "VOIR PLUS",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    const Icon(Icons.arrow_forward_ios, size: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
