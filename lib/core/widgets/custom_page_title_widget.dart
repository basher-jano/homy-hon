import 'package:flutter/material.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.pageTitleTextStyle,
    );
  }
}
