import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';

import '../../core/widgets/custom_button.dart';
import 'widgets/pick_image.dart';

class UploadShopScreen extends StatelessWidget {
  const UploadShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
       
        body: SafeArea(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(title: "Add Shop", arrow_back: true),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            MyCustomRadioButton(
                              lables: ['isfurnished', 'Notfurnished'],
                              values: ['isfurnished', 'Notfurnished'],
                              function: (value) {
                                if (value == "isfurnished") {
                                  print(value);
                                  context
                                      .read<AddpropertyBloc>()
                                      .addShopPrams
                                      .isFrunched = 1;
                                } else {
                                  context
                                      .read<AddpropertyBloc>()
                                      .addShopPrams
                                      .isFrunched = 0;
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        MyCustomRadioButton(
                          lables: ['has cladding', 'not cladding'],
                          values: ['has cladding', 'not cladding'],
                          function: (value) {
                            if (value == "has cladding") {
                              print(value);
                              context.read<AddpropertyBloc>().addShopPrams.hasCladding =
                                  1;
                            } else {
                              context.read<AddpropertyBloc>().addShopPrams.hasCladding =
                                  0;
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Container(
                              height: 40,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  border: Border.all(
                                    color: kblue,
                                  )),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    AppNavigation.navigateTo(
                                        context: context,
                                        destination: ImagePickerScreen());
                                  },
                                  child: Text(
                                    "Add some picture to your property ",
                                    style:
                                        TextStyles.textStyle16.copyWith(color: kGrey),
                                  ),
                                ),
                              ),
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
                                     context.read<AddpropertyBloc>().add(AddPropertysevent());
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
        ),
      ),
    );
  }
}
