
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:crafty_bay/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/banner_slider.dart';
import '../widgets/search_text_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final TextTheme textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            SearchTextField(searchEditingController: TextEditingController(),),
            const SizedBox(height: 16,),
            const BannerSlider(),
            const SizedBox(height: 16,),
            _buildCategoriesSection()
          ],
        ),
      ),
    );
  }

  Column _buildCategoriesSection() {
    return Column(
            children: [
              SectionHeader(title: 'Categories',onTap: (){},),
              const SizedBox(height: 8,),
              SizedBox(
                height: 140,
                child: _buildCategoriesListView(),
              ),
            ],
          );
  }

  Widget _buildCategoriesListView() {
    return ListView.separated(
                scrollDirection:Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(Icons.computer,size: 48,color: AppColors.themeColor,),
                        ),
                        const SizedBox(height: 4,),
                        Text('Computers',style: TextStyle(color: AppColors.themeColor),)
                      ],
                    );
              },
                separatorBuilder: (_,__)=> const SizedBox(width: 8,)
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