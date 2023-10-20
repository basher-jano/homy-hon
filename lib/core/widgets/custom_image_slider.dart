import 'package:flutter/material.dart';

import 'custom_image_widget.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({
    super.key,
    required this.imageList,
  });
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CustomImage(
            image: imageList[index],
            width: MediaQuery.of(context).size.width * 0.85,
            height: 260,
          ),
        ),
      ),
    );
  }
}
