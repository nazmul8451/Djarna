import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeAnOfferScreen extends StatefulWidget {
  const MakeAnOfferScreen({super.key});

  static const String name = "/make-offer";

  @override
  State<MakeAnOfferScreen> createState() => _MakeAnOfferScreenState();
}

class _MakeAnOfferScreenState extends State<MakeAnOfferScreen> {
  String _enteredAmount = "";
  // 0 = 10% off, 1 = 20% off, 2 = custom
  int _selectedPreset = 2;

  static const double _listingPrice = 3499.0;
  static const double _minOfferPercent = 0.60;

  double get _lowestPossible => _listingPrice * _minOfferPercent;

  double get _enteredValue =>
      double.tryParse(_enteredAmount.replaceAll(',', '.')) ?? 0.0;

  bool get _isTooLow =>
      _enteredAmount.isNotEmpty && _enteredValue < _lowestPossible;

  bool get _canOffer =>
      _enteredAmount.isNotEmpty && _enteredValue >= _lowestPossible;

  void _onKeyPressed(String key) {
    setState(() {
      if (key == '⌫') {
        if (_enteredAmount.isNotEmpty) {
          _enteredAmount = _enteredAmount.substring(
            0,
            _enteredAmount.length - 1,
          );
        }
      } else if (key == '.') {
        if (!_enteredAmount.contains('.')) {
          if (_enteredAmount.isEmpty) {
            _enteredAmount = '0.';
          } else {
            _enteredAmount += '.';
          }
        }
      } else {
        if (_enteredAmount.length < 10) {
          _enteredAmount += key;
        }
      }
      _selectedPreset = 2;
    });
  }

  void _applyPreset(int index) {
    setState(() {
      _selectedPreset = index;
      if (index == 0) {
        // 10% off
        final val = _listingPrice * 0.90;
        _enteredAmount = val.toStringAsFixed(2);
      } else if (index == 1) {
        // 20% off
        final val = _listingPrice * 0.80;
        _enteredAmount = val.toStringAsFixed(2);
      }
    });
  }

  String get _displayAmount {
    if (_enteredAmount.isEmpty) return "0";
    return _enteredAmount;
  }

  double get _buyerProtectionFee => _enteredValue * 0.025;
  double get _totalWithFee => _enteredValue + _buyerProtectionFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
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
          "Make an offer",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductRow(),
                  SizedBox(height: 20.h),
                  _buildPresetChips(),
                  SizedBox(height: 24.h),
                  _buildPriceDisplay(),
                  SizedBox(height: 8.h),
                  if (_isTooLow) _buildErrorSection(),
                  if (!_isTooLow && _enteredAmount.isNotEmpty)
                    _buildProtectionNote(),
                  SizedBox(height: 24.h),
                  _buildOfferButton(),
                  SizedBox(height: 12.h),
                  _buildOffersRemainingRow(),
                ],
              ),
            ),
          ),
          _buildCustomKeypad(),
        ],
      ),
    );
  }

  Widget _buildProductRow() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            'assets/images/yellow_silk.png',
            width: 56.w,
            height: 56.w,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.image, color: Colors.grey, size: 28.sp),
            ),
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Robe longue en lin beige",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Item Price: ",
                      style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                    ),
                    TextSpan(
                      text: "3,499 FCFA",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: const Color(0xFFB58322),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPresetChips() {
    final presets = [
      {'label': '\$ 4.50', 'sub': '10% Off'},
      {'label': '\$ 4.00', 'sub': '20% Off'},
      {'label': 'Custom', 'sub': 'Set a Price'},
    ];

    return Row(
      children: List.generate(presets.length, (i) {
        final isSelected = _selectedPreset == i;
        return Expanded(
          child: GestureDetector(
            onTap: () => _applyPreset(i),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.white,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFB58322)
                      : const Color(0xFFDDDDDD),
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFFB58322).withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                children: [
                  Text(
                    presets[i]['label']!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? const Color(0xFFB58322)
                          : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    presets[i]['sub']!,
                    style: TextStyle(fontSize: 11.sp, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPriceDisplay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Text(
                "\$",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: _isTooLow
                      ? const Color(0xFFE53935)
                      : const Color(0xFFB58322),
                ),
              ),
            ),
            Text(
              _displayAmount,
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
                color: _isTooLow
                    ? const Color(0xFFE53935)
                    : const Color(0xFFB58322),
              ),
            ),
          ],
        ),
        Container(
          height: 2.h,
          color: _isTooLow
              ? const Color(0xFFE53935)
              : const Color(0xFFB58322).withOpacity(0.4),
        ),
      ],
    );
  }

  Widget _buildErrorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          "Offer too low. You can't offer less than 75% of the listing price.",
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFFE53935),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Minimum offer allowed: ${(_minOfferPercent * 100).toStringAsFixed(0)}% of listing price",
          style: TextStyle(fontSize: 12.sp, color: Colors.black54),
        ),
        SizedBox(height: 4.h),
        Text(
          "Lowest possible offer: \$${_lowestPossible.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 12.sp, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildProtectionNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          "\$${_totalWithFee.toStringAsFixed(2)} incl. Buyer Protection fee",
          style: TextStyle(fontSize: 13.sp, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildOfferButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _canOffer ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _canOffer
              ? const Color(0xFFB58322)
              : Colors.grey[300],
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          elevation: 0,
        ),
        child: Text(
          "Offer",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: _canOffer ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _buildOffersRemainingRow() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 13.sp, color: Colors.black54),
          children: [
            const TextSpan(text: "25 offers left for today. "),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Learn why",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xFFB58322),
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomKeypad() {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['.', '0', '⌫'],
    ];

    return Container(
      color: AppColors.backgroundLight,
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        bottom: MediaQuery.of(context).padding.bottom + 12.h,
        top: 8.h,
      ),
      child: Column(
        children: keys.map((row) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: row.map((key) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: _buildKey(key),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String key) {
    final bool isBackspace = key == '⌫';
    return GestureDetector(
      onTap: () => _onKeyPressed(key),
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: const Color(0xFFB58322),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: isBackspace
              ? Icon(Icons.backspace_outlined, color: Colors.white, size: 22.sp)
              : Text(
                  key,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
