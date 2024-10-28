import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:crafty_bay/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/banner_slider.dart';
import '../widgets/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          ],
        ),
      ),
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




