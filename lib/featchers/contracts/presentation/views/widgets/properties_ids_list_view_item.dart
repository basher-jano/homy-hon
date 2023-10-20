import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/add_contract/add_contract_bloc.dart';

class PropertiesIdsListViewItem extends StatelessWidget {
  const PropertiesIdsListViewItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kPropertyDetailsView,
            extra: [
              context.read<AddContractBloc>().myPropertiesIds[index],
              true
            ],
          );
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: kLightBlue2, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              context.read<AddContractBloc>().myPropertiesIds[index].toString(),
              style: TextStyles.underlinedTextStyle.copyWith(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
