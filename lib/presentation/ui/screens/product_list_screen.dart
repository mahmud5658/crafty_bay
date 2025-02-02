import 'package:crafty_bay/Data/model/category_model.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/bottom_nav_controller.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListByCategoryController>().getProductListByCategory(widget.category.id!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){
          Get.find<BottomNavController>().backToHome();
        }, icon: const Icon(Icons.arrow_back_ios)),
        title:  Text(widget.category.categoryName??''),
      ),
      body: GetBuilder<ProductListByCategoryController>(
        builder: (productListByCategoryController) {
          
          if(productListByCategoryController.inProgress){
            return const CenteredCircularProgressIndicator();
          }
          if(productListByCategoryController.errorMessage!=null){
            return Center(
              child: Text(productListByCategoryController.errorMessage!),
            );
          }
          if(productListByCategoryController.productList.isEmpty){
            return const Center(
              child: Text("Empty Product List"),
            );
          }
          return GridView.builder(
            itemCount: productListByCategoryController.productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75, crossAxisCount: 3),
              itemBuilder: (context, index) {
                return ProductCard(product: productListByCategoryController.productList[index],);
              });
        }
      ),
    );
  }
}
