import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_controller.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          Get.find<BottomNavController>().backToHome();
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Electronics"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75, crossAxisCount: 3),
          itemBuilder: (context, index) {
            return const ProductCard();
          }),
    );
  }
}
