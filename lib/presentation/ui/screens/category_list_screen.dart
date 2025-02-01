import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

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
          title: const Text("Categories"),
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if(categoryListController.inProgress){
                return const CenteredCircularProgressIndicator();
              }else if(categoryListController.errorMessage!=null){
                return Center(
                  child: Text(categoryListController.errorMessage!),
                );
              }
              return GridView.builder(
                itemCount: categoryListController.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9, crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return  CategoryCard(category: categoryListController.categories[index],);
                  });
            }
          ),
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavController>().backToHome();
  }
}
