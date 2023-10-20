import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({super.key, required this.childwidget});
  final Widget childwidget;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.height * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.2)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.2),
          child: childwidget,
        ));
  }
}
