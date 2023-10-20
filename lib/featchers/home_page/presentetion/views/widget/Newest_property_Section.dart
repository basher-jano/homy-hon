import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/featchers/all_properties/presentation/manager/all_properties_cubit/all_properties_cubit.dart';

import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart';
import '../../manager/newest_property_cubit/newest_property_cubit.dart';
import 'newest_property_list_view.dart';

class NewestPropertySection extends StatelessWidget {
  const NewestPropertySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
              child: Text(
                "Newest Properties",
                style: TextStyles.logoTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AllPropertiesCubit>(context)
                    .fetchallProperties();
                GoRouter.of(context).push(AppRouter.kAllPropertiesView);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  "See all",
                  style: TextStyles.NormalTextStyle,
                ),
              ),
            ),
          ],
        ),
        BlocBuilder<NewestPropertyCubit, NewestPropertyState>(
          builder: (context, state) {
            if (state is NewestPropertyLoading) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 3.1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                            height: 80,
                            width: 150,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomShimmer(
                                    width: 0, height: 0, radius: 10),
                              ),
                            ));
                      }));
            } else {
              return Container(
                height: MediaQuery.of(context).size.height / 2.95,
                child: NewestPropertyListView(
                    properties:
                        BlocProvider.of<NewestPropertyCubit>(context).response),
              );
            }
          },
        ),
      ],
    );
  }
}
