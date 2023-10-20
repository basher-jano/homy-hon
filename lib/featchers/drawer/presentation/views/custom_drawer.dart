import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'widgets/custom_drawer_button_list.dart';
import 'widgets/drawer_user_information_section.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: kWhite,
      child: Column(
        children:  [
          DrawerUserInforamtionSection(),
          CustomDrawerButtonList()
        ],
      ),
    );
  }
}
