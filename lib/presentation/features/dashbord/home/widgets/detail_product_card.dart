import 'package:djarna/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String? oldPrice;
  final String category;
  final String discount;
  final String location;
  final String imageUrl;
  final VoidCallback? onTap;

  const DetailProductCard({
    super.key,
    required this.title,
    required this.price,
    this.oldPrice,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.asset(
                    imageUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Discount Badge (Top Left)
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
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Category Tag (Bottom Left)
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
                      category.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Info Section
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                "$price ${AppStrings.currency}",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFB58322),
                ),
              ),
              if (oldPrice != null) ...[
                SizedBox(width: 8.w),
                Text(
                  oldPrice!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14.sp,
                color: Colors.black26,
              ),
              SizedBox(width: 4.w),
              Text(
                location,
                style: TextStyle(fontSize: 12.sp, color: Colors.black26),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
