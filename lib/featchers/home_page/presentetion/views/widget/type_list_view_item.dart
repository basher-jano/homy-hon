import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../my_properties/presintation/manager/my_properties_cubit/my_properties_cubit.dart';

class TypeListViewItem extends StatefulWidget {
  TypeListViewItem({super.key, required this.text});
  var cardColor = kWhite;
  var txtColor = kDarkBlue;
  final String text;
  @override
  State<TypeListViewItem> createState() => _TypeListViewItemState();
}

class _TypeListViewItemState extends State<TypeListViewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MyPropertiesCubit>(context).type = widget.text;
        BlocProvider.of<MyPropertiesCubit>(context)
            .fetchTypedProperties(widget.text.toLowerCase());
        GoRouter.of(context)
            .push(AppRouter.kTypePropertiesView, extra: widget.text);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: widget.cardColor,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyles.NormalTextStyle.copyWith(
              fontSize: 15, color: widget.txtColor),
        )),
      ),
    );
  }
}
