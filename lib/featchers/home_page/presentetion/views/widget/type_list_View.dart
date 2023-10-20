import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/type_list_view_item.dart';

// ignore: must_be_immutable
class TypeListView extends StatelessWidget {
  TypeListView({
    super.key,
    required this.list,
  });
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(8),
              child: TypeListViewItem(text: list[index]),
            ));
  }
}
