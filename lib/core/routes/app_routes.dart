import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
import 'package:djarna/presentation/features/auth/sign_up_screen.dart';
import 'package:djarna/presentation/features/auth/verify_number_screen.dart';
import 'package:djarna/presentation/features/dashbord/bottom_nav_bar/custom_bottombar.dart';
import 'package:djarna/presentation/features/dashbord/home/checkout_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/make_offer_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/payment_screen.dart';
import 'package:djarna/presentation/features/dashbord/home/product_details_screen.dart';
import 'package:djarna/presentation/features/dashbord/message/chat_details_screen.dart';
import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route Name Constants
  static const String splash = "/";
  static const String sign_in = SignInScreen.name;
  static const String sign_up = SignUpScreen.name;
  static const String verify_number = VerifyNumberScreen.name;
  static const String custom_bottom_bar = CustomBottomBar.name;
  static const String product_details = ProductDetailsScreen.name;
  static const String checkOut = CheckoutScreen.name;
  static const String payment = PaymentScreen.name;
  static const String chat_details = ChatDetailsScreen.name;
  static const String make_offer = MakeAnOfferScreen.name;

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    sign_in: (context) => const SignInScreen(),
    sign_up: (context) => const SignUpScreen(),
    verify_number: (context) => const VerifyNumberScreen(),
    custom_bottom_bar: (context) => const CustomBottomBar(),
    product_details: (context) => const ProductDetailsScreen(),
    checkOut: (context) => const CheckoutScreen(),
    payment: (context) => const PaymentScreen(),
    //chat details screen and make offer screen spacial case
    chat_details: (context) => const ChatDetailsScreen(),
    make_offer: (context) => const MakeAnOfferScreen(),
  };
}
