import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

import 'custom_elevated_card_text.dart';
import '../../../../../../core/widgets/custom_rounded_icon.dart';

class CustomDetailsLisViewtItem extends StatelessWidget {
  CustomDetailsLisViewtItem({
    super.key,
    required this.icon,
    required this.name,
    required this.content,
    bool? editable,
    required this.type,
    required this.propertyId,
    required this.propertyType,
  }) {
    if (editable != null) {
      this.editable = editable;
    }
  }
  final String propertyType;
  final int propertyId;
  final String type;
  final IconData icon;
  final String name;
  final String content;
  bool editable = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRoundedIcon(
          icon: icon,
        ),
        const SizedBox(width: 30),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyles.textStyle20,
          ),
        ),
        editable == true
            ? IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kEditInfo, extra: [
                    name,
                    type,
                    content,
                    propertyId,
                    icon,
                    propertyType,
                  ]);
                },
                icon: const Icon(
                  Icons.edit,
                  color: kDarkBlue,
                ))
            : Container(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElavatedCardText(text: content),
            ],
          ),
        )
      ],
    );
  }
}
