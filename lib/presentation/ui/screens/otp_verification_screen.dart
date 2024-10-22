import 'package:crafty_bay/presentation/ui/screens/complete_Profile_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 82,),
              AppLogoWidget(),
              SizedBox(height: 24,),
              Text('Enter OTP Code',style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: 8,),
              Text('A 4 digit otp has been sent to email',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54
              ),),
              SizedBox(height: 16,),
          PinCodeTextField(
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
              inactiveColor: AppColors.themeColor
            ),
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            enableActiveFill: true,
            appContext: context,
            onCompleted: (value) {},
            onChanged: (value) {
              if (mounted) {
                setState(() {
                });
              }
            },
          ),
              SizedBox(height: 16,),
              ElevatedButton(
                  onPressed:_onTapNextButton, child: Text('Next')),
              const SizedBox(height: 16,),
              RichText(text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey
                ),
                text: 'This code will expire in',
                children: [
                  TextSpan(
                    text: '120s',style: TextStyle(color: AppColors.themeColor)
                  )
                ]
              )),
              const SizedBox(height: 16,),
              TextButton(onPressed: (){}, child: const Text('Resend code'))
            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.to(()=> const CompleteProfileScreen());
  }
  @override
  void dispose() {
    super.dispose();
    _otpTEController.dispose();
  }
}
