import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_image_slider.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/property_details_bloc/property_details_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/actions_section.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_details_list_view.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_elevated_card_text.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_like_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_description_box.dart';
import '../../../drawer/presentation/views/custom_drawer.dart';
import 'widgets/details_widgets/property_details_success_view.dart';

class PropetyDetailsView extends StatelessWidget {
  PropetyDetailsView({
    super.key,
    required this.extra,
  });
  final List<Object> extra;
  late int id;
  late bool editable;
  @override
  Widget build(BuildContext context) {
    id = extra[0] as int;
    editable = extra[1] as bool;
    return BlocBuilder<PropertyDetailsBloc, PropertyDetailsState>(
      bloc: context.read<PropertyDetailsBloc>().property != null &&
              context.read<PropertyDetailsBloc>().property!.list.property.id ==
                  id
          ? (context.read<PropertyDetailsBloc>()..add(CheckWishList()))
          : (context.read<PropertyDetailsBloc>()
            ..add(PropertyDetailsInitialEvent(id))),
      builder: (context, state) {
        if (state is PropertyDetailsSuccess) {
          return SafeArea(
            child: Scaffold(
              drawer: const CustomDrawer(),
              body: Column(
                children: [
                  CustomAppBar(
                    title: 'Details',
                    menu: true,
                    arrow_back: true,
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<PropertyDetailsBloc>()
                            .add(PropertyDetailsInitialEvent(id));
                      },
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomImageSlider(
                              imageList: state.property.list.images),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 260,
                                      child: Text(
                                        state.property.list.property.description,
                                        style: TextStyles.pageTitleTextStyle,
                                        
                                       
                                      ),
                                    ),
                                    editable == true
                                        ? IconButton(
                                            onPressed: () {
                                              GoRouter.of(context).push(
                                                AppRouter.kEditPropertyImages,
                                                extra: context
                                                    .read<PropertyDetailsBloc>()
                                                    .property,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit_square,
                                              color: kDarkBlue,
                                            ))
                                        : Container(),
                                    const Expanded(child: SizedBox()),
                                    BlocBuilder<PropertyDetailsBloc,
                                        PropertyDetailsState>(
                                      builder: (context, state) {
                                        if (state is PropertyDetailsSuccess) {
                                          return CustomLikeButton(
                                            id: id,
                                            isInWishList: state.isLiked,
                                          );
                                        }
                                        if (context
                                                .read<PropertyDetailsBloc>()
                                                .isLikedLoading ==
                                            true) {
                                          return CircularProgressIndicator();
                                        } else {
                                          return CustomLikeButton(
                                            id: id,
                                            isInWishList: context
                                                .read<PropertyDetailsBloc>()
                                                .isLiked,
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                                editable == true
                                    ? state.property.list.property
                                                .acceptRefuse !=
                                            null
                                        ? Row(
                                            children: [
                                              const Text(
                                                'status : ',
                                                style: TextStyles.textStyle18,
                                              ),
                                              Text(
                                                state.property.list.property
                                                            .acceptRefuse ==
                                                        1
                                                    ? 'accepted'
                                                    : 'refused',
                                                style: TextStyles.textStyle18
                                                    .copyWith(
                                                        color: state
                                                                    .property
                                                                    .list
                                                                    .property
                                                                    .acceptRefuse ==
                                                                1
                                                            ? kGreen
                                                            : kRed),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              const Text(
                                                'status : ',
                                                style: TextStyles.textStyle18,
                                              ),
                                              Text(
                                                'Pending',
                                                style: TextStyles.textStyle18
                                                    .copyWith(color: kOrange),
                                              ),
                                            ],
                                          )
                                    : Container(),
                                const SizedBox(height: 30),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomElavatedCardText(
                                      text: state.property.list.property
                                          .propertyableType,
                                      preIcon: Icons.house_outlined,
                                    ),
                                    const Expanded(child: SizedBox(width: 35)),
                                    CustomElavatedCardText(
                                      text: state.property.list.property
                                                  .rentSale ==
                                              0
                                          ? 'Sell'
                                          : 'Rent',
                                      preIcon: Icons.help_outline,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                CustomDetailsListView(
                                  propertyId: id,
                                  property: state.property,
                                  editable: editable == true ? true : false,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "About this property",
                                  style: TextStyles.textStyle20
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 20),
                                CustomDescriptionBox(
                                  text:
                                      state.property.list.property.description,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Location",
                                  style: TextStyles.textStyle20
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: kLightBlue,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${state.property.list.governorateName}, ${state.property.list.region}',
                                      style: TextStyles.textStyle16,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // const SizedBox(height: 30),
                                Text(
                                  "Publisher",
                                  style: TextStyles.textStyle20
                                      .copyWith(fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: kLightBlue,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${state.property.list.account.firstName}, ${state.property.list.account.lastName}',
                                      style: TextStyles.textStyle16,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),
                                Text(
                                  state.property.list.owner.officeName ?? '',
                                  style: TextStyles.textStyle16,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  state.property.list.account.email,
                                  style: TextStyles.textStyle16,
                                ),
                                const SizedBox(height: 20),
                                ActionsSection(
                                  id: id,
                                  property: state.property,
                                  withComments: true,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is PropertyDetailsLoading) {
          return const SafeArea(
              child: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ));
        } else if (state is PropertyDetailsFailure) {
          return SafeArea(
              child: Scaffold(
            body: Center(
                child: Text(
              state.errMsg,
              style: const TextStyle(color: kBlack),
            )),
          ));
        } else {
          return Scaffold();
        }
      },
    );
  }
}
