import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.radius,
  });

  final double width;
  final double height;
  final double? radius;

  bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      print("TRUEEEEEEEEEE");
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  final String image;

  @override
  Widget build(BuildContext context) {
    if (image != '') {
      print("NOT NUUUUUUUUUUUUULLLL");
      try {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 15),
          child: CachedNetworkImage(
            imageUrl: image,
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outline,
              color: kGrey,
            ),
          ),
        );
      } catch (e) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 15),
          child: CachedNetworkImage(
            imageUrl:
                "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg",
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        );
      }
    } else {
      print("NULLLLL");
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl:
              "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg",
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      );
    }
  }
}
