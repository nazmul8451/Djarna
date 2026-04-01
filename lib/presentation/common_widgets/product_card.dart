import 'package:djarna/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String oldPrice;
  final String category;
  final String discount;
  final String location;
  final String imageUrl;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.discount,
    required this.location,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                      // bottomLeft: Radius.circular(15.r),
                      // bottomRight: Radius.circular(15.r),
                    ),
                    child: imageUrl.startsWith('http')
                        ? Image.network(
                            imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: double.infinity,
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                ),
                          )
                        : Image.asset(
                            imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  height: double.infinity,
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                  ),
                                ),
                          ),
                  ),
                // Discount Badge
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      discount,
                      style: TextStyle(
                        color: const Color(0xFFB58322),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Category Tag
                Positioned(
                  bottom: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB58322),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
            // Info Section
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFB58322),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        oldPrice,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    AppStrings.currency,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFB58322),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14.sp,
                        color: Colors.black26,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
