import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
      theme: ThemeData(
          colorSchemeSeed: AppColors.themeColor,
          scaffoldBackgroundColor: Colors.white,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: AppColors.themeColor),
          textTheme: const  TextTheme(
            headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600,color: Colors.black),
          ),
          inputDecorationTheme: InputDecorationTheme(
              border: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              focusedBorder: _outlineInputBorder(),
              errorBorder: _outlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.grey)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.themeColor,
                  textStyle: const TextStyle(fontSize: 16))),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.themeColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 16),
                fixedSize: const Size.fromWidth(double.maxFinite)),
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w500))),
    );
  }
  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor, width: 2),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
