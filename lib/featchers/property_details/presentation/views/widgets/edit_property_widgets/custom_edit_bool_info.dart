import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';
import 'package:homy_hon/core/widgets/custom_rounded_icon.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/edit_info_bloc/edit_info_bloc.dart';

class CustomEditBoolInfo extends StatelessWidget {
  CustomEditBoolInfo({
    super.key,
    required this.icon,
    required this.name,
    required this.content,
    required this.propertyId,
    required this.propertyType,
  });
  final int propertyId;
  final String propertyType;
  final IconData icon;
  final String name;
  final String content;
  String? newContent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRoundedIcon(
                icon: icon,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text(
                  name,
                  style: TextStyles.pageTitleTextStyle,
                ),
              ),
              SizedBox(
                child: MyCustomRadioButton(
                  lables: ['Yes', 'No'],
                  values: ['true', 'false'],
                  function: (value) {
                    newContent = value;
                  },
                  defaultSelected: content == 'yes' ? 'true' : 'false',
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        BlocConsumer<EditInfoBloc, EditInfoState>(
          listener: (context, state) {
            if (state is EditInfoSuccess) {
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
                            state.message,
                            style: TextStyles.textStyle18,
                          ),
                        )),
                  ),
                ),
              );
            } else if (state is EditInfoFailure) {
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
                            state.message,
                            style: TextStyles.textStyle18,
                          ),
                        )),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is EditInfoLoading) {
              return Container(
                  decoration: const BoxDecoration(
                      color: kDarkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                    child: CircularProgressIndicator(
                      color: kWhite,
                    ),
                  ));
            } else {
              return Custombutton(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                radius: 10,
                color: kDarkBlue,
                title: 'Edit',
                ontap: () {
                  if (newContent != null) {
                    context.read<EditInfoBloc>().add(EditPropertyInfoEvent(
                          name,
                          newContent!,
                          propertyType,
                          propertyId,
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kGrey,
                        content: Text(
                          'please change the value of $name to upload changes',
                          style: TextStyles.textStyle18.copyWith(color: kRed),
                        )));
                  }
                  print(name);
                },
                textstyle: TextStyles.textStyle18.copyWith(color: kWhite),
              );
            }
          },
        ),
      ],
    );
  }
}
