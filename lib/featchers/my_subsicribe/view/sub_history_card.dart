// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_elevated_button.dart';

class CustomSubHistoryCard extends StatelessWidget {
  final String? title;
  final String endIN;
  final String period;
  const CustomSubHistoryCard({
    Key? key,
    this.title,
    required this.endIN,
    required this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title ?? "",
                style: TextStyles.textStyle20
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const Divider(color: kBlack),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    'enid : $endIN ',
                    style: TextStyles.textStyle16,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Period : $period days',
                    style: TextStyles.textStyle16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: kLightBlue2,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                        ),
                        child: Center(
                            child: Text(
                          "",
                          style: TextStyles.textStyle16,
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
