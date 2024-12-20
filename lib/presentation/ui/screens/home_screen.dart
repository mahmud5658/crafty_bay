
import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utility/assets_path.dart';
import '../widgets/widgets.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late final TextTheme textTheme = Theme.of(context).textTheme;

  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              SearchTextField(searchEditingController: TextEditingController(),),
              const SizedBox(height: 16,),
              const BannerSlider(),
              const SizedBox(height: 16,),
              _buildCategoriesSection(),
              _buildPopularProductSection(),
              _buildNewProductSection(),
              _buildSpecialProductSection()
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoriesSection() {
    return Column(
            children: [
              SectionHeader(title: 'All Categories',onTap: (){
                Get.find<BottomNavBarController>().category();
              },),
              const SizedBox(height: 8,),
              SizedBox(
                height: 120,
                child: GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                    return Visibility(
                      visible: categoryListController.inProgress== false,
                        replacement: const CenterProgressIndicator(),
                        child:  HorizontalCategoriesListView(categoryList: categoryListController.categoryList,));
                  }
                ),
              ),
            ],
          );
  }
  Widget _buildPopularProductSection(){
    return Column(
      children: [
        SectionHeader(title: 'Popular',onTap: (){},),
        const SizedBox(
            height: 200,
            child: HorizontalProductListView())
      ],
    );
  }
  Widget _buildNewProductSection(){
    return Column(
      children: [
        SectionHeader(title: 'New',onTap: (){},),
        const SizedBox(
            height: 200,
            child: HorizontalProductListView())
      ],
    );
  }
  Widget _buildSpecialProductSection(){
    return Column(
      children: [
        SectionHeader(title: 'Special',onTap: (){},),
        const SizedBox(
            height: 200,
            child: HorizontalProductListView())
      ],
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions:  [
        AppBarIconButton(iconData: Icons.person,onTap: (){},),
        const SizedBox(width: 8,),
        AppBarIconButton(iconData: Icons.call,onTap: (){},),
        const SizedBox(width: 8,),
        AppBarIconButton(iconData: Icons.notifications,onTap: (){},),
      ],
    );
  }
}