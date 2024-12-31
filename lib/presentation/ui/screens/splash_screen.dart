import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset('assets/images/logo.svg',width: 100,),
            const Spacer(),
            const CircularProgressIndicator(),
            const Text('Version 1.0.0')
          ],
        ),
      ),
    ),
  );
  }
}
