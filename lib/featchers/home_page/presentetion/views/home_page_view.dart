import 'package:flutter/material.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/Newest_property_Section.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/Property_types_Section.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/newest_ads_Section.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../main.dart';
import '../../../drawer/presentation/views/custom_drawer.dart';
class HomePageVeiw extends StatelessWidget {

   HomePageVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          endDrawer: const CustomDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "Home Hon", menu: true, arrow_back: false),
             
              const PropertyTypeSection(),
              const NewestPropertySection(),
              const NewestAdsSection()
            ],
          )),
    );
  }
}
