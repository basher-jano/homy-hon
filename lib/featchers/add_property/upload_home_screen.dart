import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/style/app_icons.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';
import 'package:homy_hon/featchers/add_property/home_details.dart';
import 'package:homy_hon/featchers/add_property/widgets/pick_image.dart';
import 'package:homy_hon/featchers/add_property/widgets/text_form_field_property.dart';

import '../../bloc/add_property/addproperty_bloc.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_button.dart';

class UploadHomeScreen extends StatelessWidget {
  const UploadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
     
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
               CustomAppBar(title: "Add House", arrow_back: true),
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
                                  .addPropertyPrams
                                  .isFrunched = 1;
                            } else {
                              context
                                  .read<AddpropertyBloc>()
                                  .addPropertyPrams
                                  .isMonthly = 0;
                            }
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          MyCustomRadioButton(
                            lables: ['green', 'tabo'],
                            values: ['green', 'tabo'],
                            function: (value) {
                              if (value == "green") {
                                print(value);
                                context
                                    .read<AddpropertyBloc>()
                                    .addPropertyPrams
                                    .greenOrTabo = 1;
                              } else {
                                context
                                    .read<AddpropertyBloc>()
                                    .addPropertyPrams
                                    .greenOrTabo = 0;
                              }
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            MyCustomRadioButton(
                              lables: ['has cladding', 'not cladding'],
                              values: ['has cladding', 'not cladding'],
                              function: (value) {
                                if (value == "has cladding") {
                                  print(value);
                                  context
                                      .read<AddpropertyBloc>()
                                      .addPropertyPrams
                                      .hasCladding = 1;
                                } else {
                                  context
                                      .read<AddpropertyBloc>()
                                      .addPropertyPrams
                                      .hasCladding = 0;
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        )),
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
                                style: TextStyles.textStyle16.copyWith(color: kGrey),
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
                            title: "Add property",
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
    );
  }
}
