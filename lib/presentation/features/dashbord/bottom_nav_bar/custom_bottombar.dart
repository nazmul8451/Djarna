import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/features/dashbord/home/home_screen.dart';
import 'package:djarna/presentation/features/dashbord/recherche/recherche_screen.dart';
import 'package:djarna/presentation/features/dashbord/vendor/vendore_screen.dart';
import 'package:djarna/presentation/features/dashbord/message/message_screen.dart';
import 'package:djarna/presentation/features/dashbord/profile/profile_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});
  static const String name = '/custom-bottom-bar';

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),

    const RechercheScreen(),
    const VendoreScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'assets/images/home_icon.png', 'Marcher'),
            _buildNavItem(1, 'assets/images/search_icon.png', 'Recherche'),
            _buildCenterItem(),
            _buildNavItem(3, 'assets/images/fav_icon.png', 'Messagerie'),
            _buildNavItem(4, 'assets/images/profile_icon.png', 'Profil'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String assetPath, String label) {
    final isSelected = _selectedIndex == index;
    final color = isSelected
        ? AppColors.buttonPrimary
        : const Color(0xFF94A3B8);

    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, width: 24.w, height: 24.h, color: color),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterItem() {
    return InkWell(
      onTap: () => _onItemTapped(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(0, -20.h),
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: const BoxDecoration(
                color: AppColors.buttonPrimary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40B58322),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/plus_icon.png',
                width: 20.w,
                height: 20.h,
                color: Colors.white,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -10.h),
            child: Text(
              'Vendre',
              style: TextStyle(
                color: AppColors.buttonPrimary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
