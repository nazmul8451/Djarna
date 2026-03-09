import 'package:djarna/core/constants/app_colors.dart';
import 'package:djarna/presentation/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  static const String name = "/payment";

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _saveCard = false;
  int _selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                "Card details",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    "Your card is securely encrypted",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.lock_outline,
                    size: 14.sp,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              _buildCardSelectionRow(),
              SizedBox(height: 32.h),
              _buildCardFormBox(),
              SizedBox(height: 32.h),
              _buildSaveCardCheckbox(),
              SizedBox(height: 48.h),
              CustomButton(
                text: "Use this card",
                onPressed: () {
                  // Handle payment action
                },
                height: 56.h,
                borderRadius: 15.r,
                fontSize: 18.sp,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardSelectionRow() {
    final cardIcons = [
      Icons.credit_card, // Placeholder for Mastercard
      Icons.credit_card, // Placeholder for Visa
      Icons.credit_card, // Placeholder for Amex
      Icons.credit_card, // Placeholder for others
    ];

    return Row(
      children: List.generate(
        cardIcons.length,
        (index) => GestureDetector(
          onTap: () => setState(() => _selectedCardIndex = index),
          child: Container(
            margin: EdgeInsets.only(right: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: _selectedCardIndex == index
                    ? const Color(0xFFE2B05E)
                    : Colors.black.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            child: Icon(
              cardIcons[index],
              size: 24.sp,
              color: _selectedCardIndex == index
                  ? const Color(0xFFE2B05E)
                  : Colors.black.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardFormBox() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F2),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFFFE5D1), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField(label: "Cardholder's name", hint: "card name"),
          SizedBox(height: 24.h),
          _buildFormField(
            label: "Card number",
            hint: "1234 1234 1234 1234",
            suffixIcon: Icons.credit_card,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: _buildFormField(label: "Expiry date", hint: "MM / YY"),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: _buildFormField(
                  label: "Security code",
                  hint: "e.g. 123",
                  suffixIcon: Icons.info_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String hint,
    IconData? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2B05E)),
            ),
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: const Color(0xFFE2B05E), size: 20.sp)
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          ),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveCardCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _saveCard = !_saveCard),
          child: Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _saveCard ? AppColors.buttonPrimary : Colors.black12,
                width: 2,
              ),
              color: _saveCard ? AppColors.buttonPrimary : Colors.transparent,
            ),
            child: _saveCard
                ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                : null,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            "Agree to save these card details for faster checkout. You can remove the card anytime in Settings, under Payments.",
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black.withOpacity(0.3),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
