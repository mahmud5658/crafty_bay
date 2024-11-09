
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets_path.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Row(
        children: [
          Image.asset(AssetsPath.dummyProductImg,
              height: 80, width: 80, fit: BoxFit.scaleDown),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title of Product',
                              style: textTheme.bodyLarge,
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                Text(
                                  'Color : Red',
                                  style: textTheme.bodySmall
                                      ?.copyWith(color: Colors.grey),
                                ),
                                Text(
                                  'Size : XL',
                                  style: textTheme.bodySmall
                                      ?.copyWith(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$100',
                      style: textTheme.titleMedium
                          ?.copyWith(color: AppColors.themeColor),
                    ),
                    ItemCount(
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      color: AppColors.themeColor,
                      buttonSizeWidth: 35,
                      buttonSizeHeight: 30,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}