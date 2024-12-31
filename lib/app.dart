import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: const SplashScreen(),
     theme: ThemeData(
       colorSchemeSeed: AppColors.themeColor,
       scaffoldBackgroundColor: Colors.white,
       progressIndicatorTheme: const ProgressIndicatorThemeData(
         color: AppColors.themeColor,
       )
     ),
   );
  }
}
