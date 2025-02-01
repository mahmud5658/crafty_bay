import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../state_holders/bottom_nav_controller.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) {
        backToHome();
      },
      canPop: false,
      child: Scaffold(
          appBar: _buildAppBar(),
          body: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildOrderDetails();
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: 10)),
              _buildPriceAndCheckout()
            ],
          )),
    );
  }

  Card _buildOrderDetails() {
    return Card(
      color: Colors.grey.shade200,
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              AssetsPath.dummyProduct,
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductDetail(),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    ItemCount(
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 10,
                      decimalPlaces: 0,
                      color: AppColors.themeColor,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildProductDetail() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Year Special Shoe",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Text(
          "Color: Red, Size: X",
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "\$100",
          style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            backToHome();
          },
          child: const Icon(Icons.arrow_back_ios)),
      title: const Text('Cart'),
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
              Text(
                "Total Price",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
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
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Checkout')),
          )
        ],
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavController>().backToHome();
  }
}
