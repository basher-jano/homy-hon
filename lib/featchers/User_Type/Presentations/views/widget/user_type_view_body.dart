import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_elevated_button.dart';
import 'package:homy_hon/featchers/User_Type/Presentations/views/widget/user_type_card_widget.dart';

class UserTypeViewBody extends StatefulWidget {
  const UserTypeViewBody({super.key});

  @override
  State<UserTypeViewBody> createState() => _UserTypeViewBodyState();
}

class _UserTypeViewBodyState extends State<UserTypeViewBody> {
  bool _freelancSelected = false;
  bool _officeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                "assets/images/real-estate-house.svg",
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Homy Hon",
            style: TextStyles.logoTextStyle.copyWith(color: kWhite),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Choose Who are you :",
            style: TextStyles.NormalTextStyle.copyWith(
                color: kWhite, fontSize: 15),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UserTypeCardWidget(
                      imgPath: "assets/images/freelance.svg",
                      title: "Freelanc",
                      ontap: () {
                        setState(() {
                          _officeSelected = false;
                          _freelancSelected = !_freelancSelected;
                        });
                      },
                      cardcolor: _freelancSelected ? kDarkBlue : kWhite,
                      imagecolor: _freelancSelected ? kWhite : kDarkBlue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 1,
                          height: 50,
                          color: kDarkBlue,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "or",
                            style: TextStyles.NormalTextStyle,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: kDarkBlue,
                        ),
                      ],
                    ),
                    UserTypeCardWidget(
                      imgPath: "assets/images/office.svg",
                      title: "office",
                      ontap: () {
                        setState(() {
                          _freelancSelected = false;
                          _officeSelected = !_officeSelected;
                        });
                      },
                      cardcolor: _officeSelected ? kDarkBlue : kWhite,
                      imagecolor: _officeSelected ? kWhite : kDarkBlue,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Custombutton(
                  ontap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kLandingView);
                  },
                  height: 60.0,
                  width: 200.0,
                  color: kDarkBlue,
                  title: "Next",
                  radius: 10.0,
                  textstyle: TextStyles.logoTextStyle.copyWith(color: kWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
