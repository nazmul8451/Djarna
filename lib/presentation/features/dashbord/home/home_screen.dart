import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_strings.dart';
import 'package:djarna/core/routes/app_routes.dart';
import 'package:djarna/presentation/common_widgets/custom_text_field.dart';
import 'package:djarna/presentation/common_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onSearchTapped;

  HomeScreen({Key? key, this.onSearchTapped}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dynamic state for filtering
  String _selectedCategory = AppStrings.all;

  // Mock category data (this would come from an API later)
  final List<Map<String, dynamic>> _categories = [
    {'name': AppStrings.all, 'count': '87', 'icon': Icons.grid_view_rounded},
    {'name': AppStrings.clothing, 'count': '147', 'icon': Icons.person_outline},
    {
      'name': AppStrings.electronics,
      'count': '321',
      'icon': Icons.person_outline,
    },
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
                SizedBox(height: 16.h),
                _buildSearchSection(),
                SizedBox(height: 16.h),
                _buildCategorySection(),
                SizedBox(height: 16.h),
                _buildPromoBanner(),
                SizedBox(height: 16.h),
                _buildSectionHeader(AppStrings.articlesPopulaires),
                SizedBox(height: 16.h),
                _buildProductList(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          AppStrings.voirTout,
          style: TextStyle(fontSize: 14.sp, color: AppColors.buttonPrimary),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    final products = [
      {
        'title': 'Sneakers de luxe',
        'price': '45,000',
        'oldPrice': '60,000 ${AppStrings.currency}',
        'category': AppStrings.clothing,
        'discount': '-25%',
        'location': 'Casablanca',
        'image': 'assets/images/Sneakers.png',
      },
      {
        'title': 'Session Spa Zen',
        'price': '15,000',
        'oldPrice': '25,000 ${AppStrings.currency}',
        'category': AppStrings.wellbeing,
        'discount': '-40%',
        'location': 'Marrakech',
        'image': 'assets/images/Spa.png',
      },
      {
        'title': 'Services Beauté',
        'price': '10,000',
        'oldPrice': '15,000 ${AppStrings.currency}',
        'category': AppStrings.services,
        'discount': '-33%',
        'location': 'Rabat',
        'image': 'assets/images/ServicesBeauté.png',
      },
      {
        'title': 'Robe longue en li...',
        'price': '3,499',
        'oldPrice': '19,000 ${AppStrings.currency}',
        'category': AppStrings.mode,
        'discount': '-10%',
        'location': 'Dakar',
        'image': 'assets/images/Robelongue.png',
      },
      {
        'title': 'Casque Bluetooth',
        'price': '25,000',
        'oldPrice': '35,000 ${AppStrings.currency}',
        'category': AppStrings.tech,
        'discount': '-28%',
        'location': 'Abidjan',
        'image': 'assets/images/Headphones.png',
      },
      {
        'title': 'Cosmétique Bio',
        'price': '8,500',
        'oldPrice': '12,000 ${AppStrings.currency}',
        'category': AppStrings.beauty,
        'discount': '-30%',
        'location': 'Lomé',
        'image': 'assets/images/Cosmétique.png',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        mainAxisExtent: 310.h,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          title: product['title'] as String,
          price: product['price'] as String,
          oldPrice: product['oldPrice'] as String,
          category: product['category'] as String,
          discount: product['discount'] as String,
          location: product['location'] as String,
          imageUrl: product['image'] as String,
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.product_details);
          },
        );
      },
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
            child: GestureDetector(
              onTap: widget.onSearchTapped,
              child: AbsorbPointer(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: TextSelectionThemeData(
                      cursorColor: AppColors.buttonPrimary,
                      selectionColor: AppColors.buttonPrimary.withOpacity(0.3),
                      selectionHandleColor: AppColors.buttonPrimary,
                    ),
                  ),
                  child: CustomTextField(
                    label: '',
                    showLabel: false,
                    hint: AppStrings.searchHint,
                    borderRadius: 15.r,
                    prefixIcon: const Icon(Icons.search, color: Colors.black38),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/search-filter'),
          child: Container(
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
              border: Border.all(
                color: AppColors.buttonPrimary.withOpacity(0.1),
              ),
            ),
            child: const Icon(Icons.tune, color: Colors.black54),
          ),
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
                    const TextSpan(
                      text: AppStrings.discountUpTo,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: "-50%",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFCC00),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                AppStrings.summerCollection,
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.seeMore,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios, size: 10),
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
