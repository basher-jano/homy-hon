import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/textStyles.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.color,
      required this.title,
      required this.ontap,
      required this.textstyle});
  final double width;
  final double height;
  final double radius;
  final Color color;
  final TextStyle textstyle;
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 230, 228, 228),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(title, style: textstyle),
          )),
    );
  }
}
