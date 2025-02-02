
import 'package:crafty_bay/Data/model/category_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.category
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ProductListScreen());
      },
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(category.categoryImg??''))
            ),
          ),
           Text(
            category.categoryName??'',
            style: const TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}