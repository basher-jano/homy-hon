import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class CustomElevatedTextField extends StatelessWidget {
  CustomElevatedTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.width,
    required this.controller,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: textInputType,
              style: const TextStyle(color: kDarkBlue),
              cursorColor: kDarkBlue,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyles.textStyle18.copyWith(color: kGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
