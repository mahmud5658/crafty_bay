import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.off(() => const EmailVerificationScreen());
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Logo(),
              Spacer(),
              CircularProgressIndicator(),
              Text('Version 1.0.0')
            ],
          ),
        ),
      ),
    );
  }
}
