import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../home_page/presentetion/manager/types/types_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkBlue,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 180,
              height: 180,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Homy Hon",
              style: TextStyles.LargelogoTextStyle,
            ),
          ],
        )),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () async {
      
      SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      print("${token}");
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      if (token == null || token == '') {
        GoRouter.of(context).pushReplacement(AppRouter.kLandingView);
      } else {
        if (UserInformation.TYPE_USER == 'office') {
          UserInformation.OFFICE_TOKEN = token;
        } else if (UserInformation.TYPE_USER == 'user') {
          UserInformation.USER_TOKEN = token;
        }

        GoRouter.of(context).pushReplacement(AppRouter.kNavigationBar);
      }
    });
  }
}
