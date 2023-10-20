import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';

import '../../constants.dart';

class MyCustomRadioButton extends StatelessWidget {
  MyCustomRadioButton({
    super.key,
    required this.lables,
    required this.values,
    required this.function,
    this.defaultSelected,
  });
  ScrollController _scrollController = ScrollController();

  final List<String> lables;
  final List<String> values;
  final Function(String) function;
  String? defaultSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Builder(
              builder: (context) {
                if (defaultSelected != null) {
                  return CustomRadioButton(
                    elevation: 3,
                    padding: 10,
                    autoWidth: true,
                    buttonTextStyle: const ButtonTextStyle(
                        textStyle: TextStyle(fontSize: 15)),
                    buttonLables: lables,
                    buttonValues: values,
                    radioButtonValue: function,
                    defaultSelected: defaultSelected,
                    unSelectedColor: kWhite,
                    selectedColor: kLightBlue,
                    enableShape: true,
                    shapeRadius: 5,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Colors.transparent,
                  );
                } else {
                  return CustomRadioButton(
                    elevation: 3,
                    padding: 10,
                    autoWidth: true,
                    buttonTextStyle: const ButtonTextStyle(
                        textStyle: TextStyle(fontSize: 15)),
                    buttonLables: lables,
                    buttonValues: values,
                    radioButtonValue: function,
                    unSelectedColor: kWhite,
                    selectedColor: kLightBlue,
                    enableShape: true,
                    shapeRadius: 5,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Colors.transparent,
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
