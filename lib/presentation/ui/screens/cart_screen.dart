import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        backToHome();
      },
      canPop: false,
      child: const Scaffold(
        body: Center(
          child: Text("Cart Screen"),
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavController>().backToHome();
  }
}
