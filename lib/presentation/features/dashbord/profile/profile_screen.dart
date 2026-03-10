import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildProfileHeader(),
              SizedBox(height: 24.h),
              _buildSectionTitle('SELLING MANAGER'),
              SizedBox(height: 8.h),
              _buildSectionCard([
                _buildSectionItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'My Listings',
                  subtitle: '24 Active \u2022 5 Sold \u2022 2 Drafts',
                  iconColor: const Color(0xFFB58322),
                  onTap: () => Navigator.pushNamed(context, '/my-listings'),
                ),
                _buildSectionItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Sales & Earnings',
                  subtitle: 'Balance: XOF 1,240.00',
                  iconColor: const Color(0xFFB58322),
                ),
                _buildSectionItem(
                  icon: Icons.stars_outlined,
                  title: 'Shop Reviews',
                  subtitle: 'View customer feedback',
                  iconColor: const Color(0xFFB58322),
                ),
              ]),
              SizedBox(height: 24.h),
              _buildSectionTitle('GENERAL'),
              SizedBox(height: 8.h),
              _buildSectionCard([
                _buildListItem(Icons.favorite_border, 'Favorite Item'),
                _buildListItem(Icons.person_add_alt, 'Invite friends'),
                _buildListItem(Icons.wallet_outlined, 'Balance'),
                _buildListItem(Icons.shopping_bag_outlined, 'My Orders'),
                _buildListItem(Icons.campaign_outlined, 'Promotional tools'),
                _buildListItem(Icons.tune_outlined, 'Personalization'),
              ]),
              SizedBox(height: 24.h),
              _buildSectionCard([
                _buildListItem(Icons.local_offer_outlined, 'Bundle discounts'),
              ]),
              SizedBox(height: 24.h),
              _buildSectionCard([
                _buildListItem(
                  Icons.menu_book_outlined,
                  'Your guide to DJARNA',
                ),
                _buildListItem(Icons.help_outline, 'Help center'),
                _buildListItem(Icons.settings_outlined, 'Settings'),
                _buildListItem(Icons.cookie_outlined, 'Cookie settings'),
              ]),
              SizedBox(height: 24.h),
              _buildSectionCard([
                _buildListItem(Icons.info_outline, 'About DJARNA'),
                _buildListItem(Icons.gavel_outlined, 'Legal Information'),
                _buildListItem(Icons.hub_outlined, 'Our platform'),
              ]),
              SizedBox(height: 24.h),
              _buildLogoutButton(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20.sp),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.buttonPrimary,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonPrimary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/images/seller_img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shahriarr61',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/my-listings'),
                  child: Row(
                    children: [
                      Text(
                        'View my listings',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14.sp,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white.withOpacity(0.9),
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xFF64748B),
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSectionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF1E293B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: const Color(0xFF64748B),
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xFFCBD5E1),
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1E293B), size: 22.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF1E293B),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: const Color(0xFFCBD5E1),
            size: 14.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
        child: Text(
          'Log Out',
          style: TextStyle(
            color: const Color(0xFFEF4444),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
