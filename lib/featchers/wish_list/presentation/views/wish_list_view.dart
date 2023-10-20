import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view.dart';
import 'package:homy_hon/featchers/wish_list/presentation/manager/wish_list_bloc/wish_list_bloc.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBar(title: 'Wish list', arrow_back: true),
          BlocBuilder<WishListBloc, WishListState>(
            bloc: (context.read<WishListBloc>()..add(WishListInetialEvent())),
            builder: (context, state) {
              if (state is WishListSuccess) {
                return Expanded(
                    child: PropertiesListView(
                  editable: false,
                  onRefresh: () async {
                    (context.read<WishListBloc>()..add(WishListInetialEvent()));
                  },
                  properties: context.read<WishListBloc>().wishList,
                ));
              } else if (state is WishListFailure) {
                return Center(
                  child: Text(
                    state.errMsg,
                    style: TextStyles.textStyle18,
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      )),
    );
  }
}
