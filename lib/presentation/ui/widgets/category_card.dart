import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>  ProductListScreen(categoryName: categoryModel.categoryName??''));
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(categoryModel.categoryImg??'')
            ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(categoryModel.categoryName??'',style:  TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}