import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../state_holders/category_list_controller.dart';
import '../widgets/home/horizontal_product_list_view.dart';
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
         SizedBox(
            height: 120,
            child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
                return  HorizontalCategoryListView(categoryList: categoryListController.categories,inProgress: categoryListController.inProgress,);
              }
            )),
      ],
    );
  }

  Column _buildPopularSection() {
    return Column(
      children: [
        SectionHeader(
          title: "Popular",
          onTap: () {
            // Get.find<PopularProductListController>().getPopularProduct();
            // Get.to(() =>  ProductListScreen(category: ,));
          },
        ),
         SizedBox(
          height: 170,
          child: GetBuilder<PopularProductListController>(
            builder: (popularProductListController) {
              return Visibility(
                visible: !popularProductListController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child: HorizontalProductListView(productList: popularProductListController.productList,
                ),
              );
            }
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
            // Get.to(() => const ProductListScreen());
          },
        ),
         SizedBox(
          height: 170,
          child: GetBuilder<NewProductListController>(
            builder: (newProductListController) {
              return  Visibility(
                visible: !newProductListController.inProgress,
                replacement: const CenteredCircularProgressIndicator(),
                child:  HorizontalProductListView(
                  productList: newProductListController.productList,
                ),
              );
            }
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
            // Get.to(() => const ProductListScreen());
          },
        ),
         SizedBox(
          height: 170,
          child: GetBuilder<SpecialProductListController>(
            builder: (specialProductListController) {
              return Visibility(
                visible: !specialProductListController.inProgress,
                child: HorizontalProductListView(productList: specialProductListController.productList,
                ),
              );
            }
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
