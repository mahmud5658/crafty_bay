import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}
class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

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
             Text('Complete Profile',style: Theme.of(context).textTheme.headlineLarge,),
             SizedBox(height: 8,),
             Text('Get started with us by providing your information',textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
               color: Colors.black54
             ),),
             SizedBox(height: 16,),
             TextFormField(
               controller: _emailTEController,
               textInputAction: TextInputAction.next,
               decoration: InputDecoration(
                   hintText: 'First Name'
               ),
             ),
             SizedBox(height: 16,),
             TextFormField(
               controller: _emailTEController,
               textInputAction: TextInputAction.next,
               decoration: InputDecoration(
                   hintText: 'Last Name'
               ),
             ),
             SizedBox(height: 16,),
             TextFormField(
               keyboardType: TextInputType.number,
               textInputAction: TextInputAction.next,
               controller: _emailTEController,
               decoration: InputDecoration(
                   hintText: 'Mobile'
               ),
             ),
             SizedBox(height: 16,),
             TextFormField(
               textInputAction: TextInputAction.next,
               controller: _emailTEController,
               decoration: InputDecoration(
                   hintText: 'City'
               ),
             ),
             SizedBox(height: 16,),
             TextFormField(
               textInputAction: TextInputAction.next,
               maxLines: 4,
               controller: _emailTEController,
               decoration: InputDecoration(
                   hintText: 'Shipping Address',
               ),
             ),
             SizedBox(height: 16,),
             ElevatedButton(
                 onPressed: _onTapCompleteButton, child: Text('Complete'))
           ],
         ),
       ),
     ),
   );
  }
  void _onTapCompleteButton(){
    Get.to(()=> const  OtpVerificationScreen());
  }
  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
  }
}
