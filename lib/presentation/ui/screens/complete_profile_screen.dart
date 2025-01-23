import 'package:crafty_bay/presentation/ui/screens/customer_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/logo.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});
  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
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
              const SizedBox(
                height: 24,
              ),
              Text(
                "Complete Profile",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Get started with us with your profile",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _mobileNumberController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Mobile"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _cityController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "City"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _shippingAddressController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "Shipping Address",
                ),
                maxLines: 4,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: _moveToNextScreen, child: const Text("Complete"))
            ],
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() {
    Get.to(() => const CustomerReviewScreen());
  }
}
