import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  static const String name = "/checkout";

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedDeliveryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black12, size: 24.sp),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  _buildProductSection(),
                  SizedBox(height: 32.h),
                  _buildSectionHeader("ADDRESS"),
                  _buildAddressBox(),
                  SizedBox(height: 24.h),
                  _buildSectionHeader("PAYMENT"),
                  _buildPaymentBox(),
                  SizedBox(height: 32.h),
                  _buildSectionHeader("DELIVERY OPTIONS"),
                  _buildDeliveryOptions(),
                  SizedBox(height: 16.h),
                  _buildPostageNotice(),
                  SizedBox(height: 32.h),
                  _buildPriceSummary(),
                  SizedBox(height: 140.h), // Space for bottom bar
                ],
              ),
            ),
            _buildBottomStickyBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              'assets/images/puzzle_vango.png', // Placeholder
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80.w,
                height: 80.w,
                color: Colors.grey[200],
                child: Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Puzzle Van Gogh",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  "Clementoni",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black38),
                ),
                Text(
                  "Very good",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black38),
                ),
                SizedBox(height: 8.h),
                Text(
                  "€5.00",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w900,
          color: Colors.black26,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildAddressBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFFFE5D1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Add your shipping address",
            style: TextStyle(fontSize: 14.sp, color: Colors.black26),
          ),
          Icon(Icons.add, color: AppColors.buttonPrimary, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildPaymentBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFFFE5D1)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(Icons.apple, color: Colors.white, size: 18.sp),
                SizedBox(width: 4.w),
                Text(
                  "Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            "Apple Pay",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Icon(Icons.edit_outlined, color: Colors.black38, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptions() {
    return Column(
      children: [
        _deliveryTile(
          0,
          Icons.home_outlined,
          "Home Delivery",
          "Get it delivered to your address.",
        ),
        SizedBox(height: 12.h),
        _deliveryTile(
          1,
          Icons.location_on_outlined,
          "Pick-up Point (Relay)",
          "Collect your item from a nearby relay location.",
        ),
        SizedBox(height: 12.h),
        _deliveryTile(
          2,
          Icons.people_outline,
          "Meet-up / Collection",
          "Arrange a direct handover with the seller.",
        ),
      ],
    );
  }

  Widget _deliveryTile(int index, IconData icon, String title, String sub) {
    bool isSelected = _selectedDeliveryIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedDeliveryIndex = index),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFB58322) : Colors.transparent,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: const Color(0xFFB56A22), size: 24.sp),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFB58322),
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(fontSize: 12.sp, color: Colors.black26),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostageNotice() {
    return Row(
      children: [
        Icon(Icons.info_outline, color: Colors.black38, size: 16.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            "Delivery cost may vary depending on the selected method.",
            style: TextStyle(fontSize: 11.sp, color: Colors.black38),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price summary",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        _summaryRow("Order", "€5.00"),
        SizedBox(height: 12.h),
        _summaryRow("Buyer Protection fee", "€0.95", showIcon: true),
        SizedBox(height: 12.h),
        _summaryRow("Shipping", "€3.75"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: const Divider(color: Colors.black12, thickness: 1),
        ),
        _summaryRow("Total to pay", "€9.70", isTotal: true),
      ],
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    bool showIcon = false,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 14.sp,
            color: isTotal ? Colors.black : Colors.black45,
            fontWeight: isTotal ? FontWeight.w900 : FontWeight.w500,
          ),
        ),
        if (showIcon) ...[
          SizedBox(width: 4.w),
          Icon(Icons.help_outline, size: 14.sp, color: Colors.black26),
        ],
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomStickyBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total to pay",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "€9.70",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonPrimary,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "Pay",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 14.sp, color: Colors.black26),
                SizedBox(width: 4.w),
                Text(
                  "Your payment details are encrypted and secure",
                  style: TextStyle(fontSize: 10.sp, color: Colors.black26),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
