
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen()async{
    await Future.delayed(const Duration(seconds: 2));
    Get.off(()=> const EmailVerificationScreen());
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Padding(
         padding: EdgeInsets.all(16),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Spacer(),
             AppLogoWidget(),
             Spacer(),
             CircularProgressIndicator(),
             Text('version 1.0',style: TextStyle(color: Colors.grey),)
           ],
         ),
       ),
     ),
   );
  }
}


