import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/property_details_bloc/property_details_bloc.dart';

import '../../../../../../constants.dart';

class CustomLikeButton extends StatefulWidget {
  CustomLikeButton({
    super.key,
    required this.isInWishList,
    required this.id,
  });
  final int id;
  bool isInWishList;

  @override
  State<CustomLikeButton> createState() => _CustomLikeButtonState();
}

class _CustomLikeButtonState extends State<CustomLikeButton> {
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      bubblesColor: const BubblesColor(
          dotPrimaryColor: kDarkBlue, dotSecondaryColor: kLightBlue),
      size: 40,
      isLiked: context.read<PropertyDetailsBloc>().isLiked,
      onTap: (isLiked) async {
        setState(() {
          context
              .read<PropertyDetailsBloc>()
              .add(AddToWishListEvent(widget.id));
          context.read<PropertyDetailsBloc>().isLiked =
              !context.read<PropertyDetailsBloc>().isLiked;
        });
      },
      likeBuilder: (isLiked) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: context.read<PropertyDetailsBloc>().isLiked != false
                    ? kLightBlue
                    : kGrey,
              )),
          child: Center(
            child: Icon(
              Icons.favorite,
              size: 30,
              color: context.read<PropertyDetailsBloc>().isLiked != false
                  ? kLightBlue
                  : kGrey,
            ),
          ),
        );
      },
    );
  }
}
