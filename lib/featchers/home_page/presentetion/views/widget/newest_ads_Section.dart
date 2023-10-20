import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/featchers/advertisements/presentation/manager/advertisements_cubit/advertisements_cubit.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_shimmer_widget.dart';
import '../../manager/newest_advertisment_cubit/newest_advertisment_cubit.dart';
import 'featured_advertisements_list_view.dart';

class NewestAdsSection extends StatelessWidget {
  const NewestAdsSection({super.key});

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
                "Newest Advertisements",
                style: TextStyles.logoTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AdvertisementsCubit>(context)
                    .fetchAdvertisements();

                GoRouter.of(context).push(AppRouter.kAdvertisementsView);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  "See all",
                  style: TextStyles.NormalTextStyle,
                ),
              ),
            )
          ],
        ),
        BlocBuilder<NewestAdvertismentCubit, NewestAdvertismentState>(
          builder: (context, state) {
            if (state is NewestAdvertismentLoading) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height / 3.1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                            height: 80,
                            width: 250,
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
              return SizedBox(
                height: MediaQuery.of(context).size.height / 3.1,
                child: FeaturedAdvertisementsListView(
                    ads: BlocProvider.of<NewestAdvertismentCubit>(context)
                        .response),
              );
            }
          },
        ),
      ],
    );
  }
}
