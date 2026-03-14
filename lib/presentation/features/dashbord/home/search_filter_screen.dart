import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  static const String name = '/search-filter';

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCondition = 'New with tags';

  final List<String> _conditions = [
    'New with tags',
    'New without tags',
    'Like new',
    'Used',
  ];

  final List<Map<String, String>> _categories = [
    {'name': 'FASHION', 'image': 'assets/images/Robelongue.png'},
    {'name': 'BEAUTY', 'image': 'assets/images/Cosmétique.png'},
    {'name': 'KIDS & BABY', 'image': 'assets/images/Sneakers.png'},
    {'name': 'HOME & DECOR', 'image': 'assets/images/Spa.png'},
    {'name': 'SECOND HAND', 'image': 'assets/images/Headphones.png'},
    {'name': 'Electronics', 'image': 'assets/images/Headphones.png'},
    {'name': 'Entertainment', 'image': 'assets/images/Robelongue.png'},
    {'name': 'Hobbies & collectables', 'image': 'assets/images/Cosmétique.png'},
    {'name': 'Sports', 'image': 'assets/images/Sneakers.png'},
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.backgroundLight,
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
          'Filter',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildConditionSection(),
                  SizedBox(height: 24.h),
                  _buildCategoryGrid(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            Icon(Icons.search, color: const Color(0xFF94A3B8), size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for items or members',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF94A3B8),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: const Color(0xFFE87C2B),
                size: 22.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConditionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FILTER BY CONDITION',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF94A3B8),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE87C2B),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _conditions.map((condition) {
              final isSelected = _selectedCondition == condition;
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedCondition = condition),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1E293B)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF1E293B)
                            : const Color(0xFFE2E8F0),
                      ),
                    ),
                    child: Text(
                      condition,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF1E293B),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 140.h,
      ),
      itemBuilder: (context, index) {
        final category = _categories[index];
        return GestureDetector(
          onTap: () {
            if (category['name'] == 'FASHION') {
              Navigator.pushNamed(context, '/fashion-category');
            } else if (category['name'] == 'BEAUTY') {
              Navigator.pushNamed(
                context,
                '/sub-category',
                arguments: 'BEAUTY',
              );
            } else if (category['name'] == 'KIDS & BABY') {
              Navigator.pushNamed(
                context,
                '/sub-category',
                arguments: 'Kids & Baby',
              );
            } else if (category['name'] == 'HOME & DECOR') {
              Navigator.pushNamed(
                context,
                '/sub-category',
                arguments: 'HOME & DECORE',
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    category['name']!,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: Image.asset(
                    category['image']!,
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
