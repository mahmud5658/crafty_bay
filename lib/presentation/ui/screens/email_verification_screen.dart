import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}
class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();
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
             Text('Welcome back',style: Theme.of(context).textTheme.headlineLarge,),
             SizedBox(height: 8,),
             Text('Please enter your email address',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
               color: Colors.black54
             ),),
             SizedBox(height: 16,),
             TextFormField(
               controller: _emailTEController,
               decoration: InputDecoration(
                 hintText: 'Email'
               ),
             ),
             SizedBox(height: 16,),
             ElevatedButton(
                 onPressed: _onTapNext, child: Text('Next'))
           ],
         ),
       ),
     ),
   );
  }
  void _onTapNext(){
    Get.to(()=> const  OtpVerificationScreen());
  }
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
