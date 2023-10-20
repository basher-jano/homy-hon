import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/textStyles.dart';

class CustomElavatedCardText extends StatelessWidget {
  const CustomElavatedCardText({
    super.key,
    required this.text,
    this.preIcon,
  });
  final String text;
  final IconData? preIcon;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(3),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                preIcon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Icon(
                          preIcon,
                          color: kLightBlue,
                        ),
                      )
                    : Container(),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyle16.copyWith(color: kLightBlue),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
