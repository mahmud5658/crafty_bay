import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category_model.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();


}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(onPressed: (){
           backToHome();
          }, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if(categoryListController.inProgress){
                return const CenterProgressIndicator();
              }else if(categoryListController.errorMessage!=null){
                return Center(
                 child: Text(categoryListController.errorMessage!),
                );
              }
              return GridView.builder(
                itemCount: categoryListController.categoryList.length,
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,), itemBuilder: (context,index){
                return  CategoryCard(categoryModel: categoryListController.categoryList[index],);
              });
            }
          ),
        ),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}
