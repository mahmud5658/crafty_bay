
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductDetailsScreen());
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(.2),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    ),
                    image: DecorationImage(image: AssetImage(AssetsPath.dummyProductImg,),
                        fit: BoxFit.scaleDown
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name',maxLines: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$120',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.themeColor),),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('3',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54),),
                          ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}