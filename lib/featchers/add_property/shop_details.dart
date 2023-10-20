import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/style/app_icons.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/add_property/upload_home_screen.dart';
import 'package:homy_hon/featchers/add_property/upload_shop_screen.dart';
import 'package:homy_hon/featchers/add_property/widgets/text_form_field_property.dart';

import '../../bloc/add_property/addproperty_bloc.dart';
import '../../core/widgets/custom_button.dart';

class ShopDetailsScreen extends StatelessWidget {
  ShopDetailsScreen({super.key});
  final _fomrKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: "Add Shop", arrow_back: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _fomrKey,
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 40,
                                width: 40,
                                color: kblue,
                              ),
                            ),
                            Image.asset(
                              AppIcons.price,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "price",
                            style: TextStyles.textStyle16,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: kGrey.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 0.8,
                              offset: const Offset(4, 2))
                        ]),
                        child: TextFormProperty(
                          onChanged: (value) {
                            context.read<AddpropertyBloc>().addShopPrams.price =
                                value;
                          },
                          horizntalPadding: 10,
                          keyboardType: TextInputType.number,
                          maxlines: 2,
                          verticalPadding: 4,
                          textStyle: TextStyles.textStyle16,
                          textAlign: TextAlign.start,
                          fillColor: kWhite,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Container(
                                height: 40,
                                width: 40,
                                color: kblue,
                              ),
                            ),
                            Image.asset(
                              AppIcons.area,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "area",
                            style: TextStyles.textStyle16,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: kGrey.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 0.8,
                              offset: const Offset(4, 2))
                        ]),
                        child: TextFormProperty(
                          onChanged: (value) {
                            context.read<AddpropertyBloc>().addShopPrams.space =
                                value;
                          },
                          keyboardType: TextInputType.number,
                          horizntalPadding: 10,
                          maxlines: 2,
                          verticalPadding: 4,
                          textStyle: TextStyles.textStyle16,
                          textAlign: TextAlign.start,
                          fillColor: kWhite,
                        ),
                      ),
                    ),                  
 SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Custombutton(
                            width: 250,
                            height: 60,
                            radius: 10,
                            color: kLightBlue,
                            title: "Continue",
                            ontap: () {
                                if (_fomrKey.currentState!.validate()) {
                            AppNavigation.navigateTo(
                                context: context,
                                destination: const UploadShopScreen());
                            print("object");
                          }
                            },
                            textstyle: TextStyles.NormalTextStyle.copyWith(
                                fontWeight: FontWeight.bold, color: kDarkBlue),
                          ),
                        ),










                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
