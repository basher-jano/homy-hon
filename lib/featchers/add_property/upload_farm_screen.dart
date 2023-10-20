import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';
import 'package:homy_hon/featchers/add_property/widgets/pick_image.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/home_page_view.dart';

import '../../core/widgets/custom_app_bar.dart';

class UploadFarmScreen extends StatelessWidget {
  const UploadFarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               CustomAppBar(title: "Add Farm", arrow_back: true),
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
                                  .addFarmPrams
                                  .isFrunched = 1;
                            } else {
                              context.read<AddpropertyBloc>().addFarmPrams.isMonthly =
                                  0;
                            }
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyCustomRadioButton(
                          lables: ['has cladding', 'No cladding'],
                          values: ['isfurnished', 'Notfurnished'],
                          function: (value) {
                            if (value == "isfurnished") {
                              print(value);
                              context
                                  .read<AddpropertyBloc>()
                                  .addFarmPrams
                                  .hasCladding = 1;
                            } else {
                              context
                                  .read<AddpropertyBloc>()
                                  .addFarmPrams
                                  .hasCladding = 0;
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
                            lables: ['has parking', 'no parking'],
                            values: ['has parking', 'no parking'],
                            function: (value) {
                              if (value == "has parking") {
                                print(value);
                                context
                                    .read<AddpropertyBloc>()
                                    .addFarmPrams
                                    .hasParking = 1;
                              } else {
                                context
                                    .read<AddpropertyBloc>()
                                    .addFarmPrams
                                    .hasParking = 0;
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
                              lables: ['has pool', 'no pool'],
                              values: ['has watter well', 'dont have  watter well'],
                              function: (value) {
                                if (value == "has watter well") {
                                  print(value);
                                  context
                                      .read<AddpropertyBloc>()
                                      .addFarmPrams
                                      .hasWaterWell = 1;
                                } else {
                                  context
                                      .read<AddpropertyBloc>()
                                      .addFarmPrams
                                      .hasWaterWell = 0;
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
                        child: Row(
                          children: [
                            MyCustomRadioButton(
                              lables: ['has stadium', 'no stadium'],
                              values: ['has stadium', 'no stadium'],
                              function: (value) {
                                if (value == "has stadium") {
                                  print(value);
                                  context
                                      .read<AddpropertyBloc>()
                                      .addFarmPrams
                                      .hasStadium = 1;
                                } else {
                                  context
                                      .read<AddpropertyBloc>()
                                      .addFarmPrams
                                      .hasStadium = 0;
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<AddpropertyBloc>()
                                    .add(AddPropertysevent());
                              },
                              child: Container(
                                color: kblue,
                                height: 40,
                                width: 120,
                                child: const Center(
                                  child: Text("Add property"),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if (context
                                    .read<AddpropertyBloc>()
                                    .photoList
                                    .isEmpty) {
                 
                                }
                              },
                              child: Container(
                                color: kblue,
                                height: 40,
                                width: 120,
                                child: const Center(
                                  child: Text("discard upload"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
