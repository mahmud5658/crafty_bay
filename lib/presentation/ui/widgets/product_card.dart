
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets_path.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ProductDetailsScreen());
      },
      child: Card(
        elevation: 3,
        child: SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 130,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: const DecorationImage(
                        image: AssetImage(
                          AssetsPath.dummyProduct,
                        ),
                        fit: BoxFit.contain)),
              ),
              const Text(
                'Product Name',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      '\$120',
                      style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w500),
                    ),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.themeColor,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Icon(Icons.favorite_outline_rounded,color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}