import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    required this.color,
    this.textColor,
    this.radius,
  });
  final Color color;
  final String title;
  final Icon? icon;
  final void Function()? onPressed;
  final Color? textColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)))),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
          elevation: const MaterialStatePropertyAll(2),
          backgroundColor: MaterialStatePropertyAll(color)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: icon ?? Container(),
          ),
          Text(title,
              style: TextStyle(
                color: textColor ?? kWhite,
                fontSize: MediaQuery.of(context).size.width * 0.03,
              )),
        ],
      ),
    );
  }
}
