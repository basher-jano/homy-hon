import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../main.dart';
import '../../../../User_Type/Presentations/views/widget/user_type_card_widget.dart';

// ignore: camel_case_types
class landingViewBody extends StatelessWidget {
  const landingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.height / 11,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
              child: SvgPicture.asset(
                "assets/images/real-estate-house.svg",
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Text(
            "Homy Hon",
            style: TextStyles.logoTextStyle.copyWith(color: kWhite),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Text(
            "Choose sign up or login ",
            style: TextStyles.NormalTextStyle.copyWith(
                color: kWhite, fontSize: 15),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 11,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 13,
                    radius: 8,
                    color: kLightBlue,
                    title: "Sign up",
                    ontap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kOtpView);
                    },
                    textstyle:
                        TextStyles.pageTitleTextStyle.copyWith(color: kBlack)),
                SizedBox(
                  height: 25,
                ),
                Custombutton(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 13,
                    radius: 8,
                    color: kDarkBlue,
                    title: "Login",
                    ontap: () {
                      GoRouter.of(context).pushReplacement(
                        AppRouter.kLoginView,
                      );
                    },
                    textstyle:
                        TextStyles.pageTitleTextStyle.copyWith(color: kWhite)),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
