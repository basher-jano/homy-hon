import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
  });
  final double width;
  final double height;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(colors: [kWhite, kGrey.withOpacity(0.5)]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: width,
          height: height,
          color: kGrey,
        ),
      ),
    );
  }
}
