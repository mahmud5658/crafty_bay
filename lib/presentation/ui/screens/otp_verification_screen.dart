import 'package:crafty_bay/presentation/ui/screens/complete_Profile_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/state_holders/second_counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  final SecondCounterController _secondCounterController = Get.find<SecondCounterController>();
  @override
  void initState(){
    super.initState();
    _secondCounterController.setAndDecreaseTime();
  }
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
                'Enter OTP Code',
                style: _textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'A 4 digit otp has been sent to email',
                style: _textTheme.bodyLarge?.copyWith(color: Colors.black54),
              ),
              const SizedBox(
                height: 16,
              ),
              _pinCodeField(),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: _onTapNextButton, child: const Text('Next')),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SecondCounterController>(builder: (time) {
                return RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.grey),
                        text: 'This code will expire in ',
                        children: [
                      TextSpan(
                          text: '${time.remainingSecond}s',
                          style: const TextStyle(color: AppColors.themeColor))
                    ]));
              }),
              const SizedBox(
                height: 16,
              ),
              TextButton(onPressed: () {}, child: const Text('Resend code'))
            ],
          ),
        ),
      ),
    );
  }
  Widget _pinCodeField() {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedColor: Colors.green,
          inactiveColor: AppColors.themeColor),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      appContext: context,
      onCompleted: (value) {},
      onChanged: (value) {},
    );
  }
  void _onTapNextButton() {
    Get.to(() => const CompleteProfileScreen());
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }


}
