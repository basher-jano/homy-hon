import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';

import '../../../../../core/widgets/custom_logo_widget.dart';
import '../../../../../core/widgets/custom_page_title_widget.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.menu,
    required this.arrow_back,
  });
  bool? menu;
  final bool? arrow_back;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.transparent,
      child: Container(
        color: kWhite,
        child: Row(
          children: [
            arrow_back == true
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 60,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 33,
                        color: kDarkBlue,
                      ),
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: 60,
                  ),
            Expanded(
              child: Center(
                child: PageTitleWidget(
                  title: title,
                ),
              ),
            ),
            menu != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: kDarkBlue,
                        )),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  )
          ],
        ),
      ),
    );
  }
}
