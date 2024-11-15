import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/app_colors.dart';

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
        visible: sliderListController.inProgress == false,
        replacement: const CenterProgressIndicator(),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 200.0,
                  onPageChanged: (index, reason) {
                    _selectedIndex.value = index;
                  }),
              items: sliderListController.sliderList.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(slider.image ?? ''),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          left: 50,
                          top: 60,
                          child: Text(slider.price ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      Positioned(
                          left: 50,
                          top: 100,
                          child: SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Buy Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: Colors.white),
                                  ))))
                    ]);
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, currentIndex, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0;
                        i < sliderListController.sliderList.length;
                        i++)
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color:
                                currentIndex == i ? AppColors.themeColor : null,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)),
                      )
                  ],
                );
              },
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}
