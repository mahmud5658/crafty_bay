import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
     onPopInvokedWithResult: (_,__){
       backToHome();
     },

      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryName),
          leading: IconButton(onPressed: (){
            backToHome();
          }, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
            itemCount: 20,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .65,
          crossAxisCount: 3 ,
          mainAxisSpacing: 16,),
            itemBuilder: (context,index){
              return ProductCard();
            }),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}
