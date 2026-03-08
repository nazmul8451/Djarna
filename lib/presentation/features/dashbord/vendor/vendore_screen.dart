import 'package:djarna/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VendoreScreen extends StatefulWidget {
  const VendoreScreen({super.key});

  @override
  State<VendoreScreen> createState() => _VendoreScreenState();
}

class _VendoreScreenState extends State<VendoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Center(
        child: Text('Vendore'),
      ),
    );
  }
}