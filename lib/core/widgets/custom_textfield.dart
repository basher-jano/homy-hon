import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/textStyles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.keyboardType,
      this.onchanged,
      this.validator,
      required this.decoration,
      this.controller,
      this.padding,
      this.width,
      this.hieght,
      this.ontap,
      this.readonly});
  final label;
  final keyboardType;
  final onchanged;
  final validator;
  final controller;
  final padding;
  final width;
  final hieght;
  final ontap;
  final readonly;

  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(padding ?? 10),
        child: Container(
            width: width,
            height: hieght,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 230, 228, 228),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                readOnly: readonly ?? false,
                onTap: ontap,
                controller: controller,
                style: TextStyles.NormalTextStyle,
                keyboardType: keyboardType,
                decoration: decoration,
                onChanged: onchanged,
                validator: validator,
              ),
            )));
  }
}
