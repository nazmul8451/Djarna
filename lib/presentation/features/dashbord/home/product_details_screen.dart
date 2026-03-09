import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/constants/app_strings.dart';
import 'package:djarna/presentation/features/dashbord/home/widgets/detail_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSection(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductHeader(),
                      Divider(
                        height: 32.h,
                        color: Colors.black.withOpacity(0.05),
                      ),
                      _buildDescriptionSection(),
                      Divider(
                        height: 32.h,
                        color: Colors.black.withOpacity(0.05),
                      ),
                      _buildAttributesSection(),
                      SizedBox(height: 24.h),
                      _buildSellerSection(),
                      SizedBox(height: 24.h),
                      _buildBuyerProtectionBanner(),
                      SizedBox(height: 24.h),
                      _buildPostageSection(),
                      SizedBox(height: 32.h),
                      _buildRelatedItemsSection(),
                      SizedBox(height: 120.h), // Space for sticky bottom bar
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Overlay Buttons
          _buildOverlayButtons(context),

          // Sticky Bottom Bar
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/yellow_silk.png',
          width: double.infinity,
          height: 480.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20.h,
          child: Row(
            children: List.generate(
              4,
              (index) => Container(
                width: 8.w,
                height: 8.w,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverlayButtons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleButton(
              Icons.arrow_back_ios_new,
              onTap: () => Navigator.pop(context),
            ),
            Row(
              children: [
                _circleButton(Icons.share_outlined),
                SizedBox(width: 15.w),
                _circleButton(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20.sp),
      ),
    );
  }

  Widget _buildProductHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Robe longue en lin beige",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "3,499 ${AppStrings.currency}",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.buttonPrimary,
              ),
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                "4,500 ${AppStrings.currency}",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Icon(Icons.location_on, size: 16.sp, color: Colors.black26),
            SizedBox(width: 4.w),
            Text(
              "New York",
              style: TextStyle(fontSize: 14.sp, color: Colors.black26),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E293B),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Robe d'été légère en lin de haute qualité. Parfaite pour les sorties décontractées ou les événements formels. État impeccable, portée une seule fois.",
          style: TextStyle(fontSize: 14.sp, color: Colors.black54, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildAttributesSection() {
    final attributes = [
      {'label': 'Category', 'value': 'Puzzles'},
      {'label': 'Brand', 'value': 'Clementoni'},
      {'label': 'Condition', 'value': 'New with tags'},
      {'label': 'Material', 'value': 'Cardboard'},
      {'label': 'Uploaded', 'value': 'an hour ago'},
    ];

    return Column(
      children: attributes.map((attr) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                attr['label']!,
                style: TextStyle(fontSize: 14.sp, color: Colors.black45),
              ),
              Row(
                children: [
                  Text(
                    attr['value']!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF1E293B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.sp,
                    color: Colors.black26,
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSellerSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F2),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFFFE5D1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Profile Stack
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.chipGrey,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            
                ],
              ),
              SizedBox(width: 12.w),
              // Name and Stars
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            "pavona1977",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFF1E293B),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE5D1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified,
                                size: 14.sp,
                                color: const Color(0xFFE67E22),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "VERIFIED",
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  color: const Color(0xFFE67E22),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star_border,
                          size: 16.sp,
                          color: const Color(0xFFE67E22),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Ask Seller Button
              SizedBox(width: 8.w),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE67E22), width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  minimumSize: Size(0, 32.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  "Ask Seller",
                  style: TextStyle(
                    fontSize: 7.sp,
                    color: const Color(0xFFE67E22),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 32.h,
            color: const Color(0xFFFFE5D1).withOpacity(0.5),
            thickness: 1,
          ),
          Row(
            children: [
              Icon(
                Icons.verified_user_outlined,
                size: 20.sp,
                color: const Color(0xFFE67E22),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VERIFIED MEMBER",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF1E293B),
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      "This seller has successfully completed identity verification.",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF64748B),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBuyerProtectionBanner() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFB58322).withOpacity(0.9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.shield_outlined, color: Colors.white, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Buyer Protection fee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13.sp,
                      height: 1.4,
                    ),
                    children: [
                      const TextSpan(text: "Our "),
                      TextSpan(
                        text: "Buyer Protection",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text:
                            " is added for a fee to every purchase made with \"Buy Now\" button. It includes our refund policy.",
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

  Widget _buildPostageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Postage",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "from \$4.39",
              style: TextStyle(fontSize: 16.sp, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          "The right of withdrawal of Article L. 221-18, as well as the legal right of conformity of articles Read more",
          style: TextStyle(fontSize: 12.sp, color: Colors.black26, height: 1.4),
        ),
      ],
    );
  }

  Widget _buildRelatedItemsSection() {
    return Column(
      children: [
        Row(
          children: [
            _buildTabItem("Member's items", 0),
            _buildTabItem("Similar items", 1),
          ],
        ),
        SizedBox(height: 24.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 24.h,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return DetailProductCard(
              title: index % 2 == 0
                  ? "Robe longue en lin beige"
                  : "Service de beauté visage",
              price: index % 2 == 0 ? "3,499" : "1,159",
              oldPrice: null,
              category: index % 2 == 0 ? AppStrings.clothing : "COSMÉTIQUE",
              discount: index % 2 == 0 ? "-10%" : "-5€",
              location: index % 2 == 0 ? "New York" : "Los Angeles",
              imageUrl: index % 2 == 0
                  ? 'assets/images/Robelongue.png'
                  : 'assets/images/Spa.png',
            );
          },
        ),
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? const Color(0xFFB58322) : Colors.black26,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 3.h,
              color: isSelected ? const Color(0xFFB58322) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    side: const BorderSide(color: Color(0xFFB58322)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    "Make an offer",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB58322),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB58322),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
