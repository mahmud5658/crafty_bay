
import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/logo.dart';
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}
class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpVerificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             const SizedBox(
               height: 90,
             ),
             const Logo(),
             const SizedBox(height: 24,),
             Text("Enter OTP Code",style: Theme.of(context).textTheme.headlineLarge,),
             const SizedBox(height: 8,),
             Text("A 4 digit OTP code has been sent",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),),
             const SizedBox(height: 16),
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
                 selectedColor: Colors.green,
                 selectedFillColor: Colors.white,
                 inactiveFillColor:Colors.white ,
                 inactiveColor: AppColors.themeColor,
               ),
               animationDuration: const Duration(milliseconds: 300),
               backgroundColor: Colors.transparent,
               enableActiveFill: true,
               controller: _otpVerificationController,
               onCompleted: (v) {
               },
               onChanged: (value) {
                 setState(() {
                 });
               }, appContext: context,
             ),
             const SizedBox(height: 8,),
             ElevatedButton(
                 onPressed:_moveToNextScreen, child: const Text("Next")),
             const SizedBox(
               height: 16,
             ),
             RichText(text: TextSpan(
               text: 'The code will be expire in ',
               style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),
               children:[
                 TextSpan(
                   style: TextStyle(color: AppColors.themeColor),
                   text: '120 s'
                 )
               ]
             ),),
             const SizedBox(height: 8,),
             TextButton(onPressed: (){}, child: const Text('Resend Code'))
           ],
         ),
       ),
     ),
   );
  }
  void _moveToNextScreen(){
    Get.to(()=>const CompleteProfileScreen());
  }
}
