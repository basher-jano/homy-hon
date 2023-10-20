import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({
    super.key,
    required this.id,
    required this.withComments,
    this.property,
  });
  final int? id;
  final bool withComments;
  final Property? property;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.28,
          height: 50,
          child: CustomElevatedButton(
            title: 'Call',
            onPressed: () {
              launchUrl(
                  Uri.parse('tel:+963 ${property!.list.account.phoneNumber}'));
            },
            color: kWhite,
            textColor: kDarkBlue,
            icon: Icon(
              Icons.call,
              size: MediaQuery.of(context).size.width * 0.05,
              color: kLightBlue,
            ),
            radius: 30,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.28,
          height: 50,
          child: CustomElevatedButton(
            title: 'Whatsapp',
            onPressed: () {
              launchUrl(Uri.parse(
                  'whatsapp://send?phone=${property!.list.account.phoneNumber}'));
            },
            color: kWhite,
            textColor: kDarkBlue,
            icon: Icon(
              Icons.sms_outlined,
              size: MediaQuery.of(context).size.width * 0.05,
              color: kLightBlue,
            ),
            radius: 30,
          ),
        ),
        const SizedBox(width: 10),
        withComments == true
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                height: 50,
                child: CustomElevatedButton(
                  title: 'Comment',
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.kPropertyComments, extra: id);
                  },
                  color: kWhite,
                  textColor: kDarkBlue,
                  icon: Icon(
                    Icons.comment_outlined,
                    color: kLightBlue,
                    size: MediaQuery.of(context).size.width * 0.05,
                  ),
                  radius: 30,
                ),
              )
            : Text(""),
      ],
    );
  }
}
