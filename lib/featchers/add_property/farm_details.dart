import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/style/app_icons.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/featchers/add_property/upload_farm_screen.dart';
import 'package:homy_hon/featchers/add_property/upload_home_screen.dart';
import 'package:homy_hon/featchers/add_property/widgets/text_form_field_property.dart';

import '../../bloc/add_property/addproperty_bloc.dart';
import '../../core/utils/textStyles.dart';
import '../../core/widgets/custom_app_bar.dart';

class FarmDetailsScreen extends StatelessWidget {
  FarmDetailsScreen({super.key});
  final _fomrKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
     
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
               CustomAppBar(title: "Add Farm", arrow_back: true),
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
                            context.read<AddpropertyBloc>().addFarmPrams.price =
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
                            context.read<AddpropertyBloc>().addFarmPrams.space =
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
                              AppIcons.bedrooms,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "bedrooms",
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
                            context
                                .read<AddpropertyBloc>()
                                .addFarmPrams
                                .bedRoomsNumber = value;
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
                              AppIcons.bathrooms,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "bathrooms",
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
                            context
                                .read<AddpropertyBloc>()
                                .addFarmPrams
                                .bathRoomsNumber = value;
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
                              AppIcons.floor,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "pool space",
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
                            context.read<AddpropertyBloc>().addFarmPrams.poolSpace =
                                value;
                          },
                          horizntalPadding: 10,
                          maxlines: 2,
                          keyboardType: TextInputType.number,
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
                              AppIcons.floor,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "pool depth",
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
                            context.read<AddpropertyBloc>().addFarmPrams.poolDepth =
                                value;
                          },
                          horizntalPadding: 10,
                          maxlines: 2,
                          keyboardType: TextInputType.number,
                          verticalPadding: 4,
                          textStyle: TextStyles.textStyle16,
                          textAlign: TextAlign.start,
                          fillColor: kWhite,
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_fomrKey.currentState!.validate()) {
                            AppNavigation.navigateTo(
                                context: context,
                                destination: const UploadFarmScreen());
                            print("object");
                          }
                        },
                        child: Container(
                          color: kblue,
                          height: 40,
                          width: 120,
                          child: const Center(
                            child: Text("continue"),
                          ),
                        ),
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
