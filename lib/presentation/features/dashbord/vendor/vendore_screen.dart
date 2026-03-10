import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendoreScreen extends StatefulWidget {
  const VendoreScreen({super.key});

  @override
  State<VendoreScreen> createState() => _VendoreScreenState();
}

class _VendoreScreenState extends State<VendoreScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController(
    text: '0',
  );
  String? _selectedCategory;
  int _selectedBoost = 1; // 0=7day, 1=14day(recommended), 2=30day
  final List<String> _uploadedImages = [];

  static const _goldColor = Color(0xFFB58322);
  static const _categories = [
    'Clothing & Apparel',
    'Electronics',
    'Home & Garden',
    'Sports',
    'Toys & Games',
    'Books',
    'Beauty & Health',
    'Other',
  ];

  final _boostOptions = const [
    {
      'title': '7-Day Boost',
      'subtitle': 'Perfect for a quick sale',
      'price': '\$2',
      'recommended': false,
    },
    {
      'title': '14-Day Boost',
      'subtitle': 'Maximize your reach & engagement',
      'price': '\$5',
      'recommended': true,
    },
    {
      'title': '30-Day Boost',
      'subtitle': 'Long-term exposure for high value items',
      'price': '\$9',
      'recommended': false,
    },
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  String get _confirmLabel {
    final prices = ['\$2', '\$5', '\$9'];
    return 'Confirm & Pay (${prices[_selectedBoost]})';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUploadSection(),
            SizedBox(height: 20.h),
            _buildLabel('Title'),
            SizedBox(height: 6.h),
            _buildTextField(
              controller: _titleController,
              hint: "Tell buyers what you're selling",
            ),
            SizedBox(height: 18.h),
            _buildLabel('Describe your item'),
            SizedBox(height: 6.h),
            _buildTextField(
              controller: _descController,
              hint: 'Tell buyers more about it',
              maxLines: 5,
            ),
            SizedBox(height: 18.h),
            _buildLabel('Price'),
            SizedBox(height: 6.h),
            _buildTextField(
              controller: _priceController,
              hint: '0',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 18.h),
            _buildLabel('Category'),
            SizedBox(height: 6.h),
            _buildCategoryDropdown(),
            SizedBox(height: 20.h),
            _buildVisibilityCard(),
            SizedBox(height: 16.h),
            Text(
              'BOOST OPTIONS',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w900,
                color: Colors.black45,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10.h),
            ...List.generate(_boostOptions.length, (i) {
              final opt = _boostOptions[i];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: i < _boostOptions.length - 1 ? 10.h : 0,
                ),
                child: _buildBoostOption(
                  index: i,
                  title: opt['title'] as String,
                  subtitle: opt['subtitle'] as String,
                  price: opt['price'] as String,
                  recommended: opt['recommended'] as bool,
                ),
              );
            }),
            SizedBox(height: 24.h),
            // ── Bottom action buttons ─────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: _goldColor,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  _confirmLabel,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  side: const BorderSide(color: _goldColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(
                  'Publish without boosting',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: _goldColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                'By posting, you agree to our terms of use',
                style: TextStyle(fontSize: 11.sp, color: Colors.black38),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  // ── App Bar ──────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Sell an item',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  // ── Upload photos box ────────────────────────
  Widget _buildUploadSection() {
    return Column(
      children: [
        if (_uploadedImages.isNotEmpty)
          SizedBox(
            height: 90.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _uploadedImages.length + 1,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (_, i) {
                if (i == _uploadedImages.length) {
                  return _addPhotoBox(small: true);
                }
                return _uploadedThumbnail(i);
              },
            ),
          )
        else
          _addPhotoBox(small: false),
      ],
    );
  }

  Widget _addPhotoBox({required bool small}) {
    return GestureDetector(
      onTap: () {
        // In production: use image_picker. For now toggle a placeholder.
        setState(() => _uploadedImages.add('photo_${_uploadedImages.length}'));
      },
      child: CustomPaint(
        painter: _DashedBorderPainter(color: _goldColor),
        child: Container(
          width: small ? 90.w : double.infinity,
          height: small ? 90.h : 130.h,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: small ? 24.sp : 32.sp, color: _goldColor),
              if (!small) ...[
                SizedBox(height: 8.h),
                Text(
                  'Upload photos',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadedThumbnail(int index) {
    return Stack(
      children: [
        Container(
          width: 90.w,
          height: 90.h,
          decoration: BoxDecoration(
            color: _goldColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(Icons.image, color: _goldColor, size: 32.sp),
        ),
        Positioned(
          top: 4.h,
          right: 4.w,
          child: GestureDetector(
            onTap: () => setState(() => _uploadedImages.removeAt(index)),
            child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black54,
              ),
              child: Icon(Icons.close, size: 12.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  // ── Label ────────────────────────────────────
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // ── Text field ───────────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black38),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: _goldColor.withValues(alpha: 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: _goldColor, width: 1.5),
        ),
      ),
    );
  }

  // ── Category dropdown ────────────────────────
  Widget _buildCategoryDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: _goldColor.withValues(alpha: 0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            'Select a category',
            style: TextStyle(fontSize: 14.sp, color: Colors.black38),
          ),
          value: _selectedCategory,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black54,
            size: 24.sp,
          ),
          items: _categories
              .map(
                (c) => DropdownMenuItem(
                  value: c,
                  child: Text(
                    c,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) => setState(() => _selectedCategory = val),
        ),
      ),
    );
  }

  // ── Visibility promo card ─────────────────────
  Widget _buildVisibilityCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF1565C0).withValues(alpha: 0.3),
          width: 1.2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E7),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.trending_up_rounded,
              color: _goldColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Increase visibility',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Promoted items appear higher in search results and may be featured on the home page. Reach more buyers faster.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 34.w,
            height: 34.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: _goldColor,
            ),
            child: Center(
              child: Text(
                'M',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Boost option card ─────────────────────────
  Widget _buildBoostOption({
    required int index,
    required String title,
    required String subtitle,
    required String price,
    bool recommended = false,
  }) {
    final isSelected = _selectedBoost == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedBoost = index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFFFF8E7) : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? _goldColor : Colors.grey.shade200,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: _goldColor.withValues(alpha: 0.12),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? _goldColor : Colors.grey.shade400,
                      width: 2,
                    ),
                    color: isSelected ? _goldColor : Colors.white,
                  ),
                  child: isSelected
                      ? Icon(Icons.check, size: 12.sp, color: Colors.white)
                      : null,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: _goldColor,
                  ),
                ),
              ],
            ),
          ),
          if (recommended)
            Positioned(
              top: -10.h,
              right: 16.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _goldColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'RECOMMENDED',
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Dashed border painter ─────────────────────────
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  _DashedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.6)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 8.0;
    const dashSpace = 5.0;
    const radius = Radius.circular(12);

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          radius,
        ),
      );

    final dashPath = Path();
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + dashWidth).clamp(0.0, metric.length);
        dashPath.addPath(
          metric.extractPath(distance, end.toDouble()),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => old.color != color;
}
