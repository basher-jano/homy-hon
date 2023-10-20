import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/featchers/office_details/presentation/manager/office_details_cubit/office_details_cubit.dart';
import 'package:homy_hon/featchers/office_details/presentation/manager/related_properties_cubit/related_properties_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../core/widgets/custom_shimmer_widget.dart';
import '../../../drawer/presentation/views/custom_drawer.dart';
import '../../../home_page/presentetion/manager/newest_property_cubit/newest_property_cubit.dart';
import '../../../home_page/presentetion/views/widget/newest_property_list_view.dart';
import '../../../property_details/presentation/views/widgets/details_widgets/actions_section.dart';

class OfficeDetailsView extends StatelessWidget {
  const OfficeDetailsView(
      {super.key, required this.account_id, required this.id});

  final int? account_id;
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfficeDetailsCubit, OfficeDetailsState>(
      builder: (context, state) {
        if (state is OfficeDetailsSuccess) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 248, 248, 248),
              drawer: const CustomDrawer(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CustomAppBar(
                        title: 'Details',
                        menu: true,
                        arrow_back: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomImage(
                      image:"https://kashmirmonitor-s01.sgp1.cdn.digitaloceanspaces.com/wp-content/uploads/2022/01/compressed.jpg",
                      height: MediaQuery.of(context).size.height / 3.1,
                      width: MediaQuery.of(context).size.width / 1.03,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.officeDetailsModel.list.office.officeName,
                            style: TextStyles.logoTextStyle,
                          ),
                          RatingBarIndicator(
                            unratedColor:
                                const Color.fromARGB(255, 202, 202, 202),
                            rating: state.officeDetailsModel.list.office.rating
                                .toDouble(),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: kLightBlue,
                            ),
                            itemCount: 5,
                            itemSize: 25.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Related Properties",
                          style:
                              TextStyles.logoTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    BlocBuilder<RelatedPropertiesCubit, RelatedPropertiesState>(
                      builder: (context, state) {
                        if (state is RelatedPropertiesLoading) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.height / 3.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                        height: 80,
                                        width: 150,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CustomShimmer(
                                                width: 0,
                                                height: 0,
                                                radius: 10),
                                          ),
                                        ));
                                  }));
                        } else if (state is RelatedPropertiesSuccess) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height / 2.95,
                            child: NewestPropertyListView(
                                properties: state.myProperties),
                          );
                        } else if (state is RelatedPropertiesIFailure) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              state.errMessage ?? " ",
                              style: TextStyles.NormalTextStyle.copyWith(
                                  fontSize: 15),
                            ),
                          );
                        } else {
                          return Text("cc");
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About this office",
                          style:
                              TextStyles.logoTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.05,
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(1, 1))
                            ]),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.officeDetailsModel.list.office
                                      .description ??
                                  " description",
                              style: TextStyles.textStyle13G
                                  .copyWith(fontSize: 15),
                              maxLines: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Location : ",
                                style: TextStyles.logoTextStyle
                                    .copyWith(fontSize: 15),
                              ),
                            )),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: kLightBlue,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${state.officeDetailsModel.list.governorateName} , ${state.officeDetailsModel.list.office.address}",
                              style: TextStyles.textStyle16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    ActionsSection(
                      id: account_id,
                      withComments: false,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        } else if (state is OfficeDetailsLoading) {
          return const SafeArea(
              child: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ));
        } else if (state is OfficeDetailsFailure) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/cloud.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Center(
                    child: Text(
                  "No Data Found",
                  style: TextStyles.NormalTextStyle.copyWith(color: kLightBlue),
                )),
              ],
            ),
          ));
        } else {
          return const Scaffold(
            body: SafeArea(
                child: Center(
                    child: Text(
              "try again",
              style: TextStyles.NormalTextStyle,
            ))),
          );
        }
      },
    );
  }
}
