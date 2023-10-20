import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class UserTypeCardWidget extends StatelessWidget {
  const UserTypeCardWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.ontap,
    required this.cardcolor,
    required this.imagecolor,
  });
  final String imgPath;
  final String title;
  final VoidCallback ontap;
  final Color cardcolor;
  final Color imagecolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 225,
        width: 175,
        decoration: BoxDecoration(
          color: cardcolor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 230, 228, 228),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imgPath,
              width: 120,
              height: 120,
              color: imagecolor,
            ),
            Text(
              title,
              style: TextStyles.logoTextStyle.copyWith(color: imagecolor),
            )
          ],
        ),
      ),
    );
  }
}
