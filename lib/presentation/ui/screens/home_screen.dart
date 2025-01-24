import 'package:crafty_bay/presentation/ui/screens/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/banner_slider.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              SearchTextField(
                searchController: _searchController,
              ),
              const SizedBox(
                height: 16,
              ),
              const BannerSlider(),
              const SizedBox(
                height: 16,
              ),
              // _buildCategorySection(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCategorySection() {
    return Column(
      children: [
        SectionHeader(
          title: "Categories",
          onTap: () {},
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.computer,
                      size: 48,
                      color: AppColors.themeColor,
                    ),
                  ),
                  const Text(
                    'Electronics',
                    style: TextStyle(color: AppColors.themeColor),
                  )
                ],
              );
            },
            itemCount: 10,
            separatorBuilder: (_, __) => const SizedBox(
              width: 8,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildPopularSection() {
    return Column(
      children: [
        SectionHeader(
          title: "Popular",
          onTap: () {},
        ),
        Card(
          elevation: 4,
          child: SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 120,
                        padding: const EdgeInsets.all(16),
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
                                fit: BoxFit.scaleDown)),
                      ),
                      const Text(
                        'Product Name',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            '\$120',
                            style: TextStyle(
                                color: AppColors.themeColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
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
                          Card(
                            color: AppColors.themeColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            child: const Padding(
                              padding: EdgeInsets.all(3),
                              child: Icon(
                                Icons.favorite_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8,
                )),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNav),
      backgroundColor: Colors.white,
      actions: [
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        )
      ],
    );
  }
}
