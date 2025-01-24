import 'package:flutter/cupertino.dart';

import 'ProductCard.dart';

class HorizontalProductListView extends StatelessWidget {
  const HorizontalProductListView({
    super.key, required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return widget;
        },
        itemCount: 10,
        separatorBuilder: (_, __) => const SizedBox(
          width: 8,
        ));
  }
}