import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListingsScreen extends StatefulWidget {
  const MyListingsScreen({super.key});

  static const String name = '/my-listings';

  @override
  State<MyListingsScreen> createState() => _MyListingsScreenState();
}

class _MyListingsScreenState extends State<MyListingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> _activeListings = [
    {
      'image': 'assets/images/Robelongue.png',
      'price': '15,000 XOF',
      'title': 'Nike Air Max 270',
      'views': '128',
      'likes': '24',
    },
    {
      'image': 'assets/images/Headphones.png',
      'price': '85,000 XOF',
      'title': 'Modern Smart Watch',
      'views': '456',
      'likes': '89',
    },
    {
      'image': 'assets/images/yellow_silk.png',
      'price': '45,000 XOF',
      'title': 'Premium...',
      'views': '82',
      'likes': '12',
    },
    {
      'image': 'assets/images/Sneakers.png',
      'price': '12,500 XOF',
      'title': 'Polarized Sunglasses',
      'views': '312',
      'likes': '45',
    },
    {
      'image': 'assets/images/Sneakers.png',
      'price': '35,000 XOF',
      'title': 'Streetwear Sneakers',
      'views': '1.2k',
      'likes': '240',
    },
    {
      'image': 'assets/images/Cosmétique.png',
      'price': '5,000 XOF',
      'title': 'Ceramic Coffee Mug',
      'views': '45',
      'likes': '8',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListingsGrid(_activeListings),
                _buildEmptyState('No Drafts'),
                _buildEmptyState('No Sold Items'),
                _buildEmptyState('No Paused Items'),
              ],
            ),
          ),
        ],
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
        'My Listings',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black45, size: 24.sp),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: AppColors.buttonPrimary,
        unselectedLabelColor: const Color(0xFF94A3B8),
        indicatorColor: AppColors.buttonPrimary,
        indicatorWeight: 3,
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        tabs: const [
          Tab(text: 'Active (12)'),
          Tab(text: 'Drafts (3)'),
          Tab(text: 'Sold (45)'),
          Tab(text: 'Paused (2)'),
        ],
      ),
    );
  }

  Widget _buildListingsGrid(List<Map<String, String>> listings) {
    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 0.72,
      ),
      itemCount: listings.length,
      itemBuilder: (context, index) {
        return _buildListingCard(listings[index]);
      },
    );
  }

  Widget _buildListingCard(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                  child: Image.asset(
                    item['image']!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () => _showListingActions(item),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.more_vert,
                        size: 20.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['price']!,
                  style: TextStyle(
                    color: AppColors.buttonPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  item['title']!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF1E293B),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.visibility_outlined,
                      size: 14.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      item['views']!,
                      style: TextStyle(
                        color: const Color(0xFF94A3B8),
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.favorite_border,
                      size: 14.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      item['likes']!,
                      style: TextStyle(
                        color: const Color(0xFF94A3B8),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showListingActions(Map<String, String> item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Listing Actions',
                        style: TextStyle(
                          color: const Color(0xFF1E293B),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Manage visibility and status of your item',
                        style: TextStyle(
                          color: const Color(0xFF64748B),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                _buildActionItem(
                  icon: Icons.edit_outlined,
                  title: 'Edit details',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/edit-listing');
                  },
                ),
                _buildActionItem(
                  icon: Icons.rocket_launch_outlined,
                  title: 'Promote / Boost',
                  subtitle: 'Get 3x more views',
                  iconColor: const Color(0xFFFF8E3C),
                  onTap: () => Navigator.pop(context),
                ),
                _buildActionItem(
                  icon: Icons.visibility_off_outlined,
                  title: 'Pause listing',
                  onTap: () => Navigator.pop(context),
                ),
                _buildActionItem(
                  icon: Icons.check_circle_outline,
                  title: 'Mark as Sold',
                  onTap: () => Navigator.pop(context),
                ),
                _buildActionItem(
                  icon: Icons.share_outlined,
                  title: 'Share to social',
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(color: Color(0xFFF1F5F9), thickness: 1),
                _buildActionItem(
                  icon: Icons.delete_outline,
                  title: 'Delete permanently',
                  textColor: const Color(0xFFEF4444),
                  iconColor: const Color(0xFFEF4444),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Color? iconColor,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: (iconColor ?? const Color(0xFF1E293B)).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor ?? const Color(0xFF1E293B),
                size: 20.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? const Color(0xFF1E293B),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: const Color(0xFFFF8E3C),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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

  Widget _buildEmptyState(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.black45, fontSize: 16.sp),
      ),
    );
  }
}
