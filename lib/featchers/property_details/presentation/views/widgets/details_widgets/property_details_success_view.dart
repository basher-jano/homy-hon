import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_description_box.dart';
import 'package:homy_hon/core/widgets/custom_image_slider.dart';
import 'package:homy_hon/featchers/drawer/presentation/views/custom_drawer.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/actions_section.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_details_list_view.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_elevated_card_text.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/details_widgets/custom_like_button.dart';

class PropertyDetailsSuccessView extends StatelessWidget {
  const PropertyDetailsSuccessView({
    super.key,
    required this.id,
    required this.property,
  });

  final int id;
  final Property property;
  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomImageSlider(imageList: property.list.images),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              property.list.property.description,
                              style: TextStyles.pageTitleTextStyle,
                            ),
                            const Expanded(child: SizedBox()),
                            // const CustomLikeButton()
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElavatedCardText(
                              text: property.list.property.propertyableType,
                              preIcon: Icons.house_outlined,
                            ),
                            const Expanded(child: SizedBox(width: 35)),
                            CustomElavatedCardText(
                              text: property.list.property.rentSale == 0
                                  ? 'Sell'
                                  : 'Rent',
                              preIcon: Icons.help_outline,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        CustomDetailsListView(
                          property: property,
                          propertyId: id,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "About this property",
                          style: TextStyles.textStyle20
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 20),
                        CustomDescriptionBox(
                          text: property.list.property.description,
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
                              '${property.list.governorateName}, ${property.list.region}',
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
                              '${property.list.account.firstName}, ${property.list.account.lastName}',
                              style: TextStyles.textStyle16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          property.list.account.email,
                          style: TextStyles.textStyle16,
                        ),
                        const SizedBox(height: 20),
                        ActionsSection(
                            id: id, property: property, withComments: true),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
