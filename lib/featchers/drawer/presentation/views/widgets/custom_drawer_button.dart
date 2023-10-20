import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_rounded_icon.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTab,
  });
  final IconData icon;
  final String title;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        children: [
          InkWell(
            onTap: onTab,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomRoundedIcon(
                    icon: icon,
                    color: kGrey,
                  ),
                ),
                Text(
                  title,
                  style: TextStyles.textStyle18.copyWith(color: kBlack),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: kBlack,
          )
        ],
      ),
    );
  }
}
