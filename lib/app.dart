import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     home: const SplashScreen(),
     theme: ThemeData(
      colorSchemeSeed: AppColors.themeColor,
       scaffoldBackgroundColor: Colors.white,
       progressIndicatorTheme: const ProgressIndicatorThemeData(
         color: AppColors.themeColor
       ),
       textTheme: TextTheme(
         headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),
       ),
       inputDecorationTheme: InputDecorationTheme(
         border: _outlineInputBorder(),
         enabledBorder: _outlineInputBorder(),
         focusedBorder: _outlineInputBorder(),
         errorBorder: _outlineInputBorder(),
         contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
       ),
       textButtonTheme: TextButtonThemeData(
         style: TextButton.styleFrom(
           foregroundColor: AppColors.themeColor,
           textStyle: TextStyle(fontSize: 16)
         )
       ),
       elevatedButtonTheme: ElevatedButtonThemeData(
         style: ElevatedButton.styleFrom(
             backgroundColor: AppColors.themeColor,
             foregroundColor: Colors.white,
             padding: EdgeInsets.symmetric(vertical: 12),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8)
             ),
             textStyle: TextStyle(
                 fontSize: 16
             ),
             fixedSize: Size.fromWidth(double.maxFinite)
         ),
       )
     ),
   );
  }
  OutlineInputBorder _outlineInputBorder([Color? color]){
    return OutlineInputBorder(
        borderSide:  BorderSide(
            color: color?? AppColors.themeColor,width: 2
        ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}

