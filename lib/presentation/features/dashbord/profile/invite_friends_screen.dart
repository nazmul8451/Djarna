import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  static const String name = '/invite-friends';

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  final String _inviteLink = 'djarna.com/invite/shahriarr61';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildReferralDetails(),
            _buildSharingSection(),
            SizedBox(height: 24.h),
            _buildActionList(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.sp),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Invite friends',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      height: 280.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/invite_friends_hero.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildReferralDetails() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 32.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get 10 €, give 5 €—invite a friend',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF0F172A),
              height: 1.2,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Invite a friend to DJARNA, and you\'ll both get 5 € when they sell their first item within 30 days. Get an extra 5 € when your friend lists 3 items within their first 7 days.',
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF64748B),
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Terms apply',
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF0F172A),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharingSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _inviteLink,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.copy_outlined,
                  color: const Color(0xFF94A3B8),
                  size: 24.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB58322),
                padding: EdgeInsets.symmetric(vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 4,
                shadowColor: const Color(0xFFB58322).withOpacity(0.3),
              ),
              child: Text(
                'Share invite link',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          _buildActionItem(icon: Icons.group_outlined, title: 'Your referrals'),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          _buildActionItem(
            icon: Icons.help_outline,
            title: 'How referrals work',
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({required IconData icon, required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF64748B), size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
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
