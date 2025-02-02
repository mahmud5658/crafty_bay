import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        backToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Electronics"),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75, crossAxisCount: 3),
            itemBuilder: (context, index) {
              // return const ProductCard();
            }),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavController>().backToHome();
  }
}
