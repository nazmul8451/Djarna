import 'package:djarna/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Djarna extends StatelessWidget {
  const Djarna({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            primaryColor: Colors.blue,
            useMaterial3: true,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.black54,
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
