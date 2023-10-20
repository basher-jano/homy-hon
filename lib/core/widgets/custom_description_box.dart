import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/textStyles.dart';

class CustomDescriptionBox extends StatelessWidget {
  const CustomDescriptionBox({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        // height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            // height: 150,
            child: Text(
              text,
              style: TextStyles.textStyle16,
            ),
          ),
        ),
      ),
    );
  }
}
