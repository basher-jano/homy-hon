import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/search_bloc/search_bloc.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/widgets/custom__range_slider.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/widgets/filter_choose_location.dart';

import '../../../../constants.dart';
import '../../../../core/utils/textStyles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_dropdown_search.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_radio_button.dart';
import '../../data/models/filter_model.dart';
import '../manager/filter_bloc/filter_bloc.dart';

class FilterPropertyView extends StatelessWidget {
  FilterPropertyView({super.key});
  ApplyFilterRepo applyFilterRepo = ApplyFilterRepoImpl();

  @override
  Widget build(BuildContext context) {
    FilterModel filterModel = new FilterModel();

    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const RangeMaintainingScrollPhysics(),
          children: [
            CustomAppBar(
              title: "Filter",
              arrow_back: true,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Status",
                    style: TextStyles.textStyle20,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MyCustomRadioButton(
                    lables: const ['For sell', 'For rent'],
                    values: const ['sell', 'rent'],
                    function: (value) {
                      filterModel.sellOrRent = value;
                      filterModel.createFilter();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Type of property",
                    style: TextStyles.textStyle20,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 15),
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyCustomRadioButton(
                        lables: const ['House', 'Shop', 'Farm'],
                        values: const ['house', 'shop', 'farm'],
                        function: (value) {
                          filterModel.type = value;
                          filterModel.createFilter();
                          filterModel.printFilterMap();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Price range",
                    style: TextStyles.textStyle20,
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomRangeSlider(
                    end: 50,
                    start: 3,
                    filterModel: filterModel,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Location",
                        style: TextStyles.textStyle20,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          AppNavigation.navigateTo(
                              context: context,
                              destination: ChooseLocationScreen());
                        },
                        title: 'Choose on map',
                        icon: const Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                        color: kLightBlue,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<FilterBloc, FilterState>(
                      bloc: context.read<FilterBloc>().governorates == null
                          ? (context.read<FilterBloc>()
                            ..add(FilterInitialEvent()))
                          : null,
                      builder: (context, state) {
                        if (context.read<FilterBloc>().governorates != null) {
                          return CustomDropDownSearch(
                            governoratesModel:
                                context.read<FilterBloc>().governorates,
                            items: context
                                .read<FilterBloc>()
                                .governorates!
                                .list
                                .values
                                .toList(),
                            hintText: 'Governorate',
                            filterModel: filterModel,
                          );
                        } else {
                          return CustomDropDownSearch(
                            items: const [],
                            hintText: 'Governorate',
                            filterModel: filterModel,
                          );
                        }
                      },
                    ),
                    BlocBuilder<FilterBloc, FilterState>(
                      builder: (context, state) {
                        if (state is RegionsSuccess) {
                          return CustomDropDownSearch(
                            items: state.regions.list.values.toList(),
                            hintText: 'Region',
                            filterModel: filterModel,
                          );
                        } else {
                          return CustomDropDownSearch(
                            items: const [],
                            hintText: 'Region',
                            filterModel: filterModel,
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: BlocConsumer<FilterBloc, FilterState>(
                      listener: (context, state) {
                        if (state is FilterSuccess) {
                          GoRouter.of(context).pushReplacement(
                            AppRouter.kFilterPropertyResult,
                            extra: state.properties,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is FilterLoading) {
                          return Container(
                              decoration: const BoxDecoration(
                                  color: kDarkBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 10),
                                child: CircularProgressIndicator(
                                  color: kWhite,
                                ),
                              ));
                        } else if (state is FilterInitial) {
                          return CustomElevatedButton(
                            onPressed: () async {
                              context
                                  .read<FilterBloc>()
                                  .add(ApplyFilterEvent(filterModel));
                              context.read<SearchBloc>().properties = null;
                            },
                            title: "Apply Filter",
                            color: kDarkBlue,
                          );
                        } else if (state is FilterSuccess) {
                          return CustomElevatedButton(
                            onPressed: () async {
                              context
                                  .read<FilterBloc>()
                                  .add(ApplyFilterEvent(filterModel));
                            },
                            title: "Apply Filter",
                            color: kDarkBlue,
                          );
                        } else {
                          return CustomElevatedButton(
                            onPressed: () async {
                              context
                                  .read<FilterBloc>()
                                  .add(ApplyFilterEvent(filterModel));
                            },
                            title: "Apply Filter",
                            color: kDarkBlue,
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
