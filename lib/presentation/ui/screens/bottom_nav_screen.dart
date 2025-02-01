import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/slider_list_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishlistScreen()
  ];
  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
    Get.find<CategoryListController>().getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.category_outlined), label: "Category"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border), label: "Favorite"),
            ]),
      );
    });
  }
}
