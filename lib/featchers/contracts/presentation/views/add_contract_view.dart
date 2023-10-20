import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/dialog/my_customButton.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/add_contract/add_contract_bloc.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/widgets/properties_ids_list_view.dart';

import 'widgets/custom_elevated_text_field.dart';

class AddContractView extends StatelessWidget {
  const AddContractView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CustomAppBar(title: 'Add Contract', arrow_back: true),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Choose one from your properties IDs:',
              style: TextStyles.textStyle20,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<AddContractBloc, AddContractState>(
            bloc: context.read<AddContractBloc>().myProperties == null
                ? (context.read<AddContractBloc>()
                  ..add(AddContractInitialEvent()))
                : null,
            builder: (context, state) {
              if (state is AddContractInitialSuccess) {
                return const SizedBox(
                  height: 50,
                  child: PropertiesIdsListView(),
                );
              } else {
                return const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedTextField(
                      controller: context.read<AddContractBloc>().idController,
                      width: MediaQuery.of(context).size.width * 0.4,
                      hintText: 'property ID',
                      textInputType: TextInputType.number),
                  CustomElevatedTextField(
                    controller: context.read<AddContractBloc>().ratioController,
                    width: MediaQuery.of(context).size.width * 0.4,
                    hintText: 'Ratio',
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomElevatedTextField(
                controller: context.read<AddContractBloc>().nameController,
                width: MediaQuery.of(context).size.width * 0.87,
                hintText: 'name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomElevatedTextField(
                controller: context.read<AddContractBloc>().phoneController,
                width: MediaQuery.of(context).size.width * 0.87,
                hintText: 'phone number',
                textInputType: TextInputType.phone,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 55,
                child: BlocConsumer<AddContractBloc, AddContractState>(
                  listener: (context, state) {
                    if (context.read<AddContractBloc>().addContractLoading ==
                            false &&
                        context.read<AddContractBloc>().addContractSuccess !=
                            null &&
                        context.read<AddContractBloc>().addContractMessage !=
                            null) {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhite,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    context
                                        .read<AddContractBloc>()
                                        .addContractMessage!,
                                    style: TextStyles.textStyle18,
                                  ),
                                )),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (context.read<AddContractBloc>().addContractLoading ==
                        true) {
                      return Container(
                          decoration: const BoxDecoration(
                              color: kDarkBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(28))),
                          child: const SizedBox(
                            width: 300,
                            height: 60,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: kWhite,
                              ),
                            ),
                          ));
                    }
                    return MyCustomButton(
                      onTap: () {
                        if (context.read<AddContractBloc>().idController.text ==
                            '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: kGrey,
                              content: Text(
                                'please fill the ID field',
                                style: TextStyles.textStyle18
                                    .copyWith(color: kRed),
                              )));
                        } else if (context
                                .read<AddContractBloc>()
                                .ratioController
                                .text ==
                            '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: kGrey,
                              content: Text(
                                'please fill the Ratio field',
                                style: TextStyles.textStyle18
                                    .copyWith(color: kRed),
                              )));
                        } else if (context
                                .read<AddContractBloc>()
                                .nameController
                                .text ==
                            '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: kGrey,
                              content: Text(
                                'please fill the Name field',
                                style: TextStyles.textStyle18
                                    .copyWith(color: kRed),
                              )));
                        } else if (context
                                .read<AddContractBloc>()
                                .phoneController
                                .text ==
                            '') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: kGrey,
                              content: Text(
                                'please fill the Phone field',
                                style: TextStyles.textStyle18
                                    .copyWith(color: kRed),
                              )));
                        }
                        if (context
                                    .read<AddContractBloc>()
                                    .nameController
                                    .text !=
                                '' &&
                            context.read<AddContractBloc>().idController.text !=
                                '' &&
                            context
                                    .read<AddContractBloc>()
                                    .ratioController
                                    .text !=
                                '' &&
                            context
                                    .read<AddContractBloc>()
                                    .phoneController
                                    .text !=
                                '') {
                          context.read<AddContractBloc>().add(
                                AddNewContractEvent(
                                  propertyId: int.parse(context
                                      .read<AddContractBloc>()
                                      .idController
                                      .text),
                                  nameFirstParty: context
                                      .read<AddContractBloc>()
                                      .nameController
                                      .text,
                                  phoneNumber: context
                                      .read<AddContractBloc>()
                                      .phoneController
                                      .text,
                                  ratio: context
                                      .read<AddContractBloc>()
                                      .ratioController
                                      .text,
                                ),
                              );
                        }
                      },
                      label: 'Add contract',
                      fillColor: kDarkBlue,
                      labelColor: kWhite,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
