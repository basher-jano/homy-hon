import 'package:flutter/material.dart';
import 'package:homy_hon/featchers/contracts/data/models/contracts_mode.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/contracts_view.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/widgets/contracts_list_view_item.dart';

class ContractsListView extends StatelessWidget {
  const ContractsListView({
    super.key,
    required this.contracts,
  });
  final Contracts contracts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: contracts.list.length,
      itemBuilder: (context, index) {
        return ContractsListViewItem(
          index: index,
          contracts: contracts,
        );
      },
    );
  }
}
