import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.title});

  static const String name = '/sub-category';
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> subCategories;

    if (title.contains('Women')) {
      subCategories = [
        {'title': 'Dresses', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Sets', 'image': 'assets/images/Spa.png'},
        {'title': 'Tops & Blouses', 'image': 'assets/images/yellow_silk.png'},
        {'title': 'Pants & Jeans', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Skirts & Shorts', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Jackets & Coats', 'image': 'assets/images/seller_img.png'},
        {
          'title': 'Traditional outfits',
          'image': 'assets/images/yellow_silk.png',
        },
        {'title': 'Modest fashion', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Lingerie', 'image': 'assets/images/Cosmétique.png'},
        {'title': 'Sportswear', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Shoes', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Bags', 'image': 'assets/images/Robelongue.png'},
        {
          'title': 'Accessories',
          'image': 'assets/images/Headphones.png',
          'sub': 'Watches, wallets, sunglasses',
        },
      ];
    } else if (title.contains('Men\'s Fashion')) {
      subCategories = [
        {'title': 'Sets', 'image': 'assets/images/Spa.png'},
        {'title': 'T-shirts & Polos', 'image': 'assets/images/yellow_silk.png'},
        {'title': 'Shirts', 'image': 'assets/images/seller_img.png'},
        {'title': 'Pants & Jeans', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Jackets', 'image': 'assets/images/seller_img.png'},
        {
          'title': 'Traditional outfits (Boubou)',
          'image': 'assets/images/yellow_silk.png',
        },
        {'title': 'Streetwear', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Sportswear', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Shoes', 'image': 'assets/images/Sneakers.png'},
        {
          'title': 'Accessories',
          'image': 'assets/images/Headphones.png',
          'sub': 'Watches, wallets, sunglasses',
        },
      ];
    } else if (title == 'Kids & Baby') {
      subCategories = [
        {
          'title': 'Baby gear (car seats, strollers, etc.)',
          'image': 'assets/images/Spa.png',
        },
        {
          'title': 'Baby hygiene & bath',
          'image': 'assets/images/Cosmétique.png',
        },
        {
          'title': 'Feeding & breastfeeding',
          'image': 'assets/images/yellow_silk.png',
        },
        {
          'title': 'Toys & educational games',
          'image': 'assets/images/Sneakers.png',
        },
        {'title': 'School supplies', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Kids room decoration', 'image': 'assets/images/Spa.png'},
      ];
    } else if (title == 'KIDS') {
      subCategories = [
        {'title': 'Girls', 'image': 'assets/images/yellow_silk.png'},
        {'title': 'Boys', 'image': 'assets/images/seller_img.png'},
        {'title': 'Baby (0-3 years)', 'image': 'assets/images/yellow_silk.png'},
        {'title': 'Sets & Outfits', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Shoes', 'image': 'assets/images/Sneakers.png'},
        {'title': 'Accessories', 'image': 'assets/images/Headphones.png'},
      ];
    } else if (title == 'BEAUTY') {
      subCategories = [
        {'title': 'Makeup', 'image': 'assets/images/Cosmétique.png'},
        {'title': 'Face care', 'image': 'assets/images/Spa.png'},
        {'title': 'Body care', 'image': 'assets/images/Cosmétique.png'},
        {
          'title': 'Hair',
          'image': 'assets/images/yellow_silk.png',
          'sub': 'Wigs, Extensions, Hair products',
        },
        {'title': 'Natural products', 'image': 'assets/images/Cosmétique.png'},
        {'title': 'Perfumes', 'image': 'assets/images/Cosmétique.png'},
        {
          'title': 'Men\'s products',
          'image': 'assets/images/seller_img.png',
          'sub': 'Beard grooming',
        },
      ];
    } else if (title.contains('HOME')) {
      subCategories = [
        {'title': 'Wall decor', 'image': 'assets/images/Spa.png'},
        {'title': 'Rugs', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Curtains', 'image': 'assets/images/yellow_silk.png'},
        {'title': 'Home linen', 'image': 'assets/images/Robelongue.png'},
        {'title': 'Lighting', 'image': 'assets/images/Spa.png'},
        {'title': 'Light furniture', 'image': 'assets/images/seller_img.png'},
        {'title': 'Handmade items', 'image': 'assets/images/Cosmétique.png'},
        {'title': 'Storage', 'image': 'assets/images/Robelongue.png'},
      ];
    } else {
      subCategories = [];
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        surfaceTintColor: Colors.transparent,
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
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemCount: subCategories.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1.h, color: Colors.grey[100]),
        itemBuilder: (context, index) {
          final item = subCategories[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 8.h,
            ),
            leading: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.grey[200]!),
              ),
            ),
            title: Text(
              item['title']!,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E293B),
              ),
            ),
            subtitle: item['sub'] != null
                ? Text(
                    item['sub']!,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF94A3B8),
                    ),
                  )
                : null,
            trailing: Icon(
              Icons.chevron_right,
              size: 20.sp,
              color: const Color(0xFF94A3B8),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
