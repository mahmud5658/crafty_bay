
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Nike shoe 2024 latest model - new year special deal',style: Theme.of(context).textTheme.titleMedium,)),
                    ItemCount(
                      initialValue: 1,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      color: AppColors.themeColor,
                      buttonSizeWidth: 35,
                      buttonSizeHeight: 30,
                      onChanged: (value) {
                      },
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Row(
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('3',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54),),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(onPressed: (){}, child: Text('Reviews')),
                        const SizedBox(
                          width: 8,
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child: Padding(padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_outline_rounded,size: 16,color: Colors.white,),
                          ),
                        )
                      ],
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
