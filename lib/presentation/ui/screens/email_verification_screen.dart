import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  late final TextTheme _textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 82,
              ),
              const AppLogoWidget(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Welcome Back',
                style: _textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Please enter your email address',
                style: _textTheme.bodyLarge?.copyWith(color: Colors.black54),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: _onTapNext, child: const Text('Next'))
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNext() {
    Get.to(() => const OtpVerificationScreen());
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
