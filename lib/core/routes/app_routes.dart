import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
import 'package:djarna/presentation/features/auth/sign_up_screen.dart';
import 'package:djarna/presentation/features/auth/verify_number_screen.dart';
import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route Name Constants
  static const String splash = "/";
  static const String sign_in = SignInScreen.name;
  static const String sign_up = SignUpScreen.name;
  static const String verify_number = VerifyNumberScreen.name;

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashScreen(),
    sign_in: (context) => const SignInScreen(),
    sign_up: (context) => const SignUpScreen(),
    verify_number: (context) => const VerifyNumberScreen(),
  };
}
