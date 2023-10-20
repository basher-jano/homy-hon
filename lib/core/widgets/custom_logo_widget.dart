import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.apartment,
          size: 30,
          color: kDarkBlue,
        ),
        SizedBox(width: 2),
        Text(
          "Homy Hon",
          style: TextStyles.logoTextStyle,
        ),
      ],
    );
  }
}
