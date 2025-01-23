
import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
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
             Text("Welcome Back",style: Theme.of(context).textTheme.headlineLarge,),
             const SizedBox(height: 8,),
             Text("Please enter your email address",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),),
             const SizedBox(height: 16),
             TextFormField(
               controller: _emailController,
               decoration: const InputDecoration(
                 hintText: "Email"
               ),
             ),
             const SizedBox(height: 8,),
             ElevatedButton(
                 onPressed:_moveToNextScreen, child: const Text("Next"))
           ],
         ),
       ),
     ),
   );
  }
  void _moveToNextScreen(){
    Get.to(()=>const OtpVerificationScreen());
  }
}
