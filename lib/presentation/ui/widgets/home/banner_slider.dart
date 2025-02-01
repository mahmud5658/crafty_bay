import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    super.key,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 192,
          child: CenteredCircularProgressIndicator(),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1.2,
                  height: 180.0,
                  onPageChanged: (index, reason) {
                    _selectedIndex.value = index;
                  }),
              items: sliderListController.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(slider.image ?? '',))),
                              ),
                              Positioned(
                                top: 50,
                                left: 40,
                                child: Column(
                                  children: [
                                    Text(slider.price??'',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.themeColor),),
                                    const SizedBox(height: 10,),
                                    SizedBox(
                                      height: 50,
                                        width: 100,
                                        child: ElevatedButton(onPressed: (){}, child: const Text('Buy Now')))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context, currentIndex, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i <sliderListController.sliders.length; i++)
                        Container(
                          height: 12,
                          width: 12,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: currentIndex == i
                                  ? AppColors.themeColor
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: currentIndex == i
                                      ? AppColors.themeColor
                                      : Colors.grey)),
                        )
                    ],
                  );
                })
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _selectedIndex.dispose();
  }
}
