import 'package:djarna/core/routes/app_routes.dart';
import 'package:djarna/presentation/features/auth/sign_in_screen.dart';
import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Djarna extends StatelessWidget {
  const Djarna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black54,
        ),
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: SplashScreen.name,
    );
  }
}
