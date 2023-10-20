import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_enum.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/dialog/error_dialog.dart';
import 'package:homy_hon/core/utils/dialog/loading_dialog.dart';
import 'package:homy_hon/core/utils/service_locator.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';
import 'package:homy_hon/featchers/add_property/farm_details.dart';
import 'package:homy_hon/featchers/add_property/home_details.dart';
import 'package:homy_hon/featchers/add_property/shop_details.dart';
import 'package:homy_hon/featchers/add_property/upload_home_screen.dart';
import 'package:homy_hon/featchers/add_property/widgets/drop_down.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/home_page_view.dart';
import 'package:homy_hon/featchers/landing_page/presentation/views/landing_view.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/filter_bloc/filter_bloc.dart';

import 'widgets/location_on_map.dart';
import 'widgets/text_form_field_property.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddPropertyBody();
  }
}

class AddPropertyBody extends StatelessWidget {
  const AddPropertyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AddpropertyBloc, AddpropertyState>(
        listener: (context, state) {
          print(state);
          print('=================srar');
          if (state.isLoading) {
            LoadingDialog().openDialog(context);
         
          } else {
            LoadingDialog().closeDialog(context);
          }
          if (state.screenState == ScreenState.succes) {
            LoadingDialog().closeDialog(context);
            GoRouter.of(context).push(AppRouter.kNavigationBar);
            ErrorDialog.openDialog(context,
                "the property uplodedd succsesfuly waiting to confirm from admin");
          }
          if (state.screenState == ScreenState.error) {
            LoadingDialog().closeDialog(context);
            ErrorDialog.openDialog(context, "some thing went wrong");
          }
          if (state.validate == Validate.falsee) {
            print("object");
            ErrorDialog.openDialog(context, "all field sholud be required");
          }
          if (state.validate == Validate.truee) {
            if (state.screenNavigate == ScreenNavigate.house) {
              AppNavigation.navigateTo(
                  context: context, destination: HomeDetailsScreen());
            }
            if (state.screenNavigate == ScreenNavigate.farm) {
              AppNavigation.navigateTo(
                  context: context, destination: FarmDetailsScreen());
            }
            if (state.screenNavigate == ScreenNavigate.shop) {
              AppNavigation.navigateTo(
                  context: context, destination: ShopDetailsScreen());
            }
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          print(state);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                     CustomAppBar(title: "Add Property", arrow_back: false,menu: true,),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Please fill the information :",
                            style: TextStyles.logoTextStyle,
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: MyCustomRadioButton(
                                lables: ['For sell', 'For rent'],
                                values: ['sell', 'rent'],
                                function: (value) {
                                  if (value == "sell") {
                                    print(value);
                                    context
                                        .read<AddpropertyBloc>()
                                        .addPropertyPrams
                                        .isRent = 0;
                                    context
                                        .read<AddpropertyBloc>()
                                        .addShopPrams
                                        .isRent = 0;
                                    context
                                        .read<AddpropertyBloc>()
                                        .addFarmPrams
                                        .isRent = 0;
                                    context
                                        .read<AddpropertyBloc>()
                                        .add(IsRentEvent());
                                  } else {
                                    context
                                        .read<AddpropertyBloc>()
                                        .addPropertyPrams
                                        .isRent = 1;
                                    context
                                        .read<AddpropertyBloc>()
                                        .addShopPrams
                                        .isRent = 1;
                                    context
                                        .read<AddpropertyBloc>()
                                        .addFarmPrams
                                        .isRent = 1;
                                    context
                                        .read<AddpropertyBloc>()
                                        .add(IsRentEvent());
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        state.isRent == true
                            ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    MyCustomRadioButton(
                                      lables: ['Monthly', 'Yearly'],
                                      values: ['sell', 'rent'],
                                      function: (value) {
                                        if (value == "sell") {
                                          print(value);
                                          context
                                              .read<AddpropertyBloc>()
                                              .addPropertyPrams
                                              .isMonthly = 1;
                                          context
                                              .read<AddpropertyBloc>()
                                              .addShopPrams
                                              .isMonthly = 1;
                                          context
                                              .read<AddpropertyBloc>()
                                              .addFarmPrams
                                              .isMonthly = 1;
                                        } else {
                                          context
                                              .read<AddpropertyBloc>()
                                              .addPropertyPrams
                                              .isMonthly = 0;
                                          context
                                              .read<AddpropertyBloc>()
                                              .addShopPrams
                                              .isMonthly = 0;
                                          context
                                              .read<AddpropertyBloc>()
                                              .addFarmPrams
                                              .isMonthly = 0;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        Text(
                          "Type of property: ",
                          style: TextStyles.NormalTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              MyCustomRadioButton(
                                lables: ['House', 'Shop', "Farm"],
                                values: ['house', 'shop', "farm"],
                                function: (value) {
                                  if (value == "house") {
                                    print(value);

                                    context.read<AddpropertyBloc>().add(
                                        NavigateEvent(
                                            screenNavigate: ScreenNavigate.house));
                                  } else if (value == "shop") {
                                    print(value);

                                    context.read<AddpropertyBloc>().add(
                                        NavigateEvent(
                                            screenNavigate: ScreenNavigate.shop));
                                  } else {
                                    print(value);

                                    context.read<AddpropertyBloc>().add(
                                        NavigateEvent(
                                            screenNavigate: ScreenNavigate.farm));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyles.NormalTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
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
                                          .addPropertyPrams
                                          .description = value;
                                      context
                                          .read<AddpropertyBloc>()
                                          .addShopPrams
                                          .description = value;
                                      context
                                          .read<AddpropertyBloc>()
                                          .addFarmPrams
                                          .description = value;
                                    },
                                    horizntalPadding: 35,
                                    verticalPadding: 15,
                                    textStyle: TextStyles.textStyle16,
                                    textAlign: TextAlign.start,
                                    fillColor: kWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Address : ",
                              style: TextStyles.NormalTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kLightBlue),
                                onPressed: () {
                                  AppNavigation.navigateTo(
                                      context: context, destination: MapScreen());
                                },
                                child: const Text("choose in map"))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      color: kLightBlue,
                                    
                                  ),
                                
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: DropDown(
                                          dropdownValue: context
                                              .read<AddpropertyBloc>()
                                              .government,
                                          isGovernortaes: true,
                                          governoratesList:
                                              state.governoratesList ?? []),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                      color: kLightBlue,
                                    
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropDown(
                                          isGovernortaes: false,
                                          dropdownValue: context
                                              .read<AddpropertyBloc>()
                                              .regionvalue,
                                          governoratesList: state.regionList ?? []),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                              context
                                  .read<AddpropertyBloc>()
                                  .add(IsValidateEvent());
                            },
                            textstyle: TextStyles.NormalTextStyle.copyWith(
                                fontWeight: FontWeight.bold, color: kDarkBlue),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
