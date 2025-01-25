import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Color> _color = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.pink
  ];
  final List<String> _size = ['S', 'M', 'L', 'XL', 'XXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildItemCountButton(),
                        _buildReviewRating(),
                        _buildPickerSection(),
                        _buildDescriptionSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildAddCart()
        ],
      ),
    );
  }

  Column _buildPickerSection() {
    return Column(
      children: [
        ColorPicker(
          colors: _color,
          onColorSelected: (color) {},
        ),
        const SizedBox(
          height: 15,
        ),
        SizePicker(sizes: _size, onSizeSelected: (size) {}),
        const SizedBox(height: 16,)
      ],
    );
  }
  Column _buildDescriptionSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
        ),
         SizedBox(
          height: 8,
        ),
         Text(
          '''A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted.''',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }
  Container _buildAddCart() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price"),
              Text(
                "\$100",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Add to Cart')),
          )
        ],
      ),
    );
  }
  Row _buildReviewRating() {
    return Row(
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '3',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
            )
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const ReviewScreen());
            },
            child: const Text("Reviews")),
        const SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(4)),
          child: const Icon(
            Icons.favorite_outline_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
  Row _buildItemCountButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            child: Text(
          'Nike shoe 2024 latest model - New year special day',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        )),
        ItemCount(
          initialValue: 1,
          minValue: 1,
          maxValue: 10,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
