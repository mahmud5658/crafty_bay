import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widgets/widget_import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
              _buildCategorySection(),
              _buildPopularSection(),
              _buildNewSection(),
              _buildSpecialSection(),
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
          onTap: () {
            Get.find<BottomNavController>().selectCategoryTab();
          },
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
            height: 120,
            child: HorizontalProductListView(widget: CategoryCard())),
      ],
    );
  }

  Column _buildPopularSection() {
    return Column(
      children: [
        SectionHeader(
          title: "Popular",
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(
            widget: ProductCard(),
          ),
        ),
      ],
    );
  }

  Column _buildNewSection() {
    return Column(
      children: [
        SectionHeader(
          title: "New",
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(
            widget: ProductCard(),
          ),
        ),
      ],
    );
  }

  Column _buildSpecialSection() {
    return Column(
      children: [
        SectionHeader(
          title: "Special",
          onTap: () {
            Get.to(() => const ProductListScreen());
          },
        ),
        const SizedBox(
          height: 170,
          child: HorizontalProductListView(
            widget: ProductCard(),
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
