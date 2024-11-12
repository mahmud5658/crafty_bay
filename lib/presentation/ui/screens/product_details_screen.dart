import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../../utility/app_colors.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(child: _buildProductDetails()),
          buildPriceAndCartSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      'Nike shoe 2024 latest models - new year special deal',
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
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
                const SizedBox(
                  height: 4,
                ),
                buildRatingAndReviewSection(),
                const SizedBox(
                  height: 16,
                ),
                ColorPicker(colors: [
                  Colors.red,
                  Colors.green,
                  Colors.yellow,
                  Colors.black
                ], onColorSelected: (color) {}),
                const SizedBox(
                  height: 16,
                ),
                SizePicker(
                    sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                    onSizeSelected: (String selected) {}),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '''A type of athletic shoe meant for competitive, high-impact cheerleading activity, often with switchable color accents to match team colors, and finger notches in the soles for use in acrobatics.''',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Wrap buildRatingAndReviewSection() {
    return Wrap(
      children: [
        Row(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  '3',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {
              Get.to(()=> ReviewScreen());
            }, child: Text('Reviews')),
            const SizedBox(
              width: 8,
            ),
            Card(
              color: AppColors.themeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.favorite_outline_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildPriceAndCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(.2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$100',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 140,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Add to Cart')))
        ],
      ),
    );
  }
}
