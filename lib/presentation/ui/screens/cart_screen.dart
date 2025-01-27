import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_controller.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        backToHome();
      },
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: ListView.separated(itemBuilder: (context,index){
              return Card(
                elevation: 5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(AssetsPath.dummyProduct,height: 100,width: 100,),
                    ),

                  ],
                ),
              );
            }, separatorBuilder: (_,__)=> SizedBox(height: 8,), itemCount: 10)),
            _buildPriceAndCheckout()
          ],
        )
      ),
    );
  }

  Container _buildPriceAndCheckout() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              Text(
                "\$100",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Add to Cart')),
          )
        ],
      ),
    );
  }
  void backToHome() {
    Get.find<BottomNavController>().backToHome();
  }
}
