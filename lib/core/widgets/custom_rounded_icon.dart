import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({
    super.key,
    required this.icon,
    this.color,
  });
  final Color? color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: const Color(0xffC4E4EB),
            borderRadius: BorderRadius.circular(17)),
        child: Icon(
          icon,
          color: color ?? kIconsColor,
        ));
  }
}
