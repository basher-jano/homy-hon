// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';

abstract class TextStyles {
  static const TextStyle logoTextStyle = TextStyle(
    fontSize: 18,
    color: kDarkBlue,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle LargelogoTextStyle = TextStyle(
    fontSize: 38,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle pageTitleTextStyle = TextStyle(
    fontSize: 20,
    color: kLightBlue,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle textStyle20 = TextStyle(
    color: kBlack,
    fontSize: 20,
  );
  static const TextStyle textStyle18 = TextStyle(
    color: kLightBlue,
    fontSize: 18,
  );
  static const TextStyle textStyle16 = TextStyle(
    color: kBlack,
    fontSize: 16,
  );
  static const TextStyle NormalTextStyle = TextStyle(
    fontSize: 18,
    color: kDarkBlue,
  );
  static const TextStyle underlinedTextStyle = TextStyle(
    fontSize: 15,
    color: kDarkBlue,
    decoration: TextDecoration.underline,
  );
  static const TextStyle textStyle13G = TextStyle(
    color: kGrey,
    fontSize: 13,
  );
}
