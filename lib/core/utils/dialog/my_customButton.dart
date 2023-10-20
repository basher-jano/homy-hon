import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
    this.fillColor = Colors.yellow,
    this.isFilled = true,
    this.labelColor = Colors.white,
    required this.label,
    this.onTap,
  }) : super(key: key);
  final Color fillColor;
  final bool isFilled;
  final Color labelColor;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: isFilled ? fillColor : null,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: fillColor),
            boxShadow: isFilled
                ? [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                    )
                  ]
                : []),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
