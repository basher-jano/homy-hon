import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/advertisements/presentation/manager/advertisements_cubit/advertisements_cubit.dart';
import 'package:homy_hon/featchers/advertisements/presentation/views/widgets/advertisements_list_view.dart';

class AdvertisementsView extends StatelessWidget {
  const AdvertisementsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertisementsCubit, AdvertisementsState>(
      builder: (context, state) {
        if (state is AdvertisementsSuccess) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  CustomAppBar(title: 'Advertisements', arrow_back: true),
                  Expanded(
                      child: AdvertisementsListView(
                    ads: BlocProvider.of<AdvertisementsCubit>(context).response,
                  )),
                ],
              ),
            ),
          );
        } else if (state is AdvertisementsLoading) {
          return Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else {
          return Center(
            child: Text("error"),
          );
        }
      },
    );
  }
}
