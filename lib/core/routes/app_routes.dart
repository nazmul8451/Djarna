import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.name:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case SignInScreen.name:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
