import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/widgets/custom_logo_widget.dart';
import '../../../../../core/widgets/custom_page_title_widget.dart';

class SearchPageAppBar extends StatelessWidget {
  const SearchPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          const SizedBox(width: 20),
          const CustomLogoWidget(),
          const SizedBox(width: 15),
          const PageTitleWidget(
            title: 'Search',
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kFilterPropertyView,
                      );
                    },
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 33,
                      color: kDarkBlue,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
