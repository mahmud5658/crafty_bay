
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_bar_controller.dart';
import '../../utils/app_colors.dart';
import '../widgets/card_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        backToHome();
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
              onPressed: () {
                backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CardItemWidget();
                },
              ),
            ),
            Container(
              child: _buildPriceAndCartSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(.2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$100',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Check out')))
        ],
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}


