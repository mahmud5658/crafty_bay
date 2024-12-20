import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: GridView.builder(
        itemCount: 20,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .65,
        crossAxisCount: 3 ,
        mainAxisSpacing: 16,


      ),
          itemBuilder: (context,index){
          return ProductCard();
      }),
    );
  }
}
