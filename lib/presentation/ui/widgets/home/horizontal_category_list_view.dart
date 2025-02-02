import 'package:crafty_bay/Data/model/category_model.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';

class HorizontalCategoryListView extends StatelessWidget {
  const HorizontalCategoryListView({
    super.key, required this.categoryList, required this.inProgress,
  });
  final List<CategoryModel> categoryList;
  final bool inProgress;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(category: categoryList[index]);
        },
        itemCount: categoryList.length,
        separatorBuilder: (_, __) => const SizedBox(
          width: 8,
        ));
  }
}