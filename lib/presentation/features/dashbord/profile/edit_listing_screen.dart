import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditListingScreen extends StatefulWidget {
  const EditListingScreen({super.key});

  static const String name = '/edit-listing';

  @override
  State<EditListingScreen> createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  final TextEditingController _titleController = TextEditingController(
    text: 'Premium Minimalist Watch - Silver Edition',
  );
  final TextEditingController _descController = TextEditingController(
    text:
        'Luxury minimalist timepiece with genuine leather strap and sapphire glass. Water-resistant up to 50m. Perfect condition, original packaging included.',
  );
  final TextEditingController _priceController = TextEditingController(
    text: '45000',
  );
  String? _selectedCategory = 'Fashion & Accessories';
  String _selectedCondition = 'Brand New';

  final List<String> _photos = [
    'assets/images/Headphones.png',
    'assets/images/Sneakers.png',
    'assets/images/Cosmétique.png',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhotoSection(),
            SizedBox(height: 24.h),
            _buildLabel('TITLE'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _titleController,
              hint: 'Listing title',
            ),
            SizedBox(height: 20.h),
            _buildLabel('CATEGORY'),
            SizedBox(height: 8.h),
            _buildCategoryDropdown(),
            SizedBox(height: 20.h),
            _buildLabel('CONDITION'),
            SizedBox(height: 8.h),
            _buildConditionChips(),
            SizedBox(height: 20.h),
            _buildLabel('DESCRIPTION'),
            SizedBox(height: 8.h),
            _buildTextField(
              controller: _descController,
              hint: 'Describe your item',
              maxLines: 5,
            ),
            SizedBox(height: 20.h),
            _buildLabel('PRICE (XOF)'),
            SizedBox(height: 8.h),
            _buildPriceField(),
            SizedBox(height: 40.h),
            _buildActionButtons(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Edit Listings',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
  
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Photos',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              '${_photos.length} / 10',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF8E3C),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _photos.length + 1,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              if (index == _photos.length) {
                return _buildAddPhotoButton();
              }
              return _buildPhotoItem(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoItem(int index) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(_photos[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: -8.h,
              right: -8.w,
              child: GestureDetector(
                onTap: () => setState(() => _photos.removeAt(index)),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.close, size: 14.sp, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
        if (index == 0) ...[
          SizedBox(height: 4.h),
          Text(
            'Main Photo',
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xFF94A3B8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAddPhotoButton() {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
      ),
      child: Icon(Icons.add, color: const Color(0xFF94A3B8)),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1E293B),
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(fontSize: 14.sp, color: const Color(0xFF1E293B)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFF94A3B8)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedCategory,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: const Color(0xFF94A3B8),
            size: 24.sp,
          ),
          items:
              ['Fashion & Accessories', 'Electronics', 'Home & Garden', 'Other']
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(
                        c,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color(0xFF1E293B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: (val) => setState(() => _selectedCategory = val),
        ),
      ),
    );
  }

  Widget _buildConditionChips() {
    return Row(
      children: ['Brand New', 'Like New', 'Used'].map((condition) {
        final isSelected = _selectedCondition == condition;
        return Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: GestureDetector(
            onTap: () => setState(() => _selectedCondition = condition),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFFF7ED) : Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF8E3C)
                      : const Color(0xFFE2E8F0),
                  width: 1.5,
                ),
              ),
              child: Text(
                condition,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? const Color(0xFFFF8E3C)
                      : const Color(0xFF94A3B8),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceField() {
    return TextField(
      controller: _priceController,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1E293B),
      ),
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(fontSize: 16.sp, color: const Color(0xFF94A3B8)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'XOF',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE87C2B),
              elevation: 4,
              shadowColor: const Color(0xFFE87C2B).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
            ),
            child: Text(
              'Save Changes',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFE2E8F0), width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.pause_circle_outline,
                  color: const Color(0xFF1E293B),
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Pause Listing',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.delete_outline, color: Colors.red, size: 18.sp),
          label: Text(
            'Delete Listing',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
