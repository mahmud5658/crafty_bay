
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(
          width: 8,
        ));
  }
}