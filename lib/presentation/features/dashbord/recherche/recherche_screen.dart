import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RechercheScreen extends StatefulWidget {
  const RechercheScreen({super.key});

  @override
  State<RechercheScreen> createState() => _RechercheScreenState();
}

class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel({required this.title, required this.imageUrl});
}

class _RechercheScreenState extends State<RechercheScreen> {
  final List<CategoryModel> categories = [
    CategoryModel(
      title: 'FASHION',
      imageUrl: 'https://images.unsplash.com/photo-1567401893414-76b7b1e5a7a5?q=80&w=600&auto=format&fit=crop',
    ),
    CategoryModel(
      title: 'BEAUTY',
      imageUrl: 'assets/images/Cosmétique.png', // Fallback to local asset
    ),
    CategoryModel(
      title: 'KIDS & BABY',
      imageUrl: 'https://images.unsplash.com/photo-1503919005314-30d93d07d823?q=80&w=600&auto=format&fit=crop',
    ),
    CategoryModel(
      title: 'HOME DECOR',
      imageUrl: 'https://images.unsplash.com/photo-1505693314120-0d443867891c?q=80&w=600&auto=format&fit=crop',
    ),
    CategoryModel(
      title: 'SECOND HAND',
      imageUrl: 'https://images.unsplash.com/photo-1521335629791-ce4aec67dd15?q=80&w=600&auto=format&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              // Search Bar
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.textGrey,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          textSelectionTheme: TextSelectionThemeData(
                            cursorColor: AppColors.buttonPrimary,
                            selectionColor: AppColors.buttonPrimary.withOpacity(0.3),
                            selectionHandleColor: AppColors.buttonPrimary,
                          ),
                        ),
                        child: const TextField(
                          cursorColor: AppColors.buttonPrimary,
                          decoration: InputDecoration(
                            hintText: 'Search for items or members',
                            hintStyle: TextStyle(
                              color: AppColors.textGrey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.buttonPrimary,
                      size: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Categories Grid
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: category.imageUrl.startsWith('http')
                                ? Image.network(
                                    category.imageUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    category.imageUrl,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          category.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
