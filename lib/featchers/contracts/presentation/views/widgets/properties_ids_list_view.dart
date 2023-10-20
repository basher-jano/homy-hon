import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/add_contract/add_contract_bloc.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/widgets/properties_ids_list_view_item.dart';

class PropertiesIdsListView extends StatelessWidget {
  const PropertiesIdsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: context.read<AddContractBloc>().myPropertiesIds.length,
      itemBuilder: (context, index) {
        return PropertiesIdsListViewItem(index: index);
      },
    );
  }
}
