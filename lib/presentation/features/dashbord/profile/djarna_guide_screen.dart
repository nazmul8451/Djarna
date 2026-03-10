import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DjarnaGuideScreen extends StatelessWidget {
  const DjarnaGuideScreen({super.key});

  static const String name = '/djarna-guide';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(context),
      body: ListView(
        children: [
          _buildListItem('Who pays for shipping?'),
          _buildListItem('What you can sell on DJARNA'),
          _buildListItem('Selling your items faster'),
          _buildListItem('Uploading step by step'),
          _buildListItem('What is an item Bump?'),
          _buildListItem('Shipping an item'),
          _buildListItem('How to set a correct price?'),
          _buildListItem('Choosing the right parcel size'),
          _buildListItem('DJARNA Balance: how it works'),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.sp),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Your guide to DJARNA',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildListItem(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: const Color(0xFFCBD5E1),
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}
