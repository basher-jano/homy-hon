import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';

import 'custom_details_list_view_item.dart';

class CustomDetailsListView extends StatelessWidget {
  CustomDetailsListView(
      {super.key,
      required this.property,
      bool? editable,
      required this.propertyId}) {
    if (editable != null) {
      this.editable = editable;
    }
  }
  final int propertyId;
  final Property property;
  bool editable = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomDetailsLisViewtItem(
            propertyType: property.list.property.propertyableType,
            propertyId: propertyId,
            editable: editable,
            icon: Icons.sell_sharp,
            content: property.list.property.price.toString() + '\$',
            name: 'price',
            type: 'int',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomDetailsLisViewtItem(
            propertyType: property.list.property.propertyableType,
            propertyId: propertyId,
            editable: editable,
            icon: Icons.aspect_ratio,
            content: property.list.property.space.toString(),
            name: 'space',
            type: 'int',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomDetailsLisViewtItem(
            propertyType: property.list.property.propertyableType,
            propertyId: propertyId,
            editable: editable,
            icon: Icons.event_seat_rounded,
            content: property.list.property.hasCladding == 1 ? 'No' : 'Yes',
            name: 'cladding',
            type: 'bool',
          ),
        ),
        property.list.details.roomNumber != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.event_seat_rounded,
                  content: property.list.details.roomNumber.toString(),
                  name: 'rooms',
                  type: 'int',
                ),
              )
            : Container(),
        property.list.details.bathroomNumber != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.bathtub,
                  content: property.list.details.bathroomNumber.toString(),
                  name: 'bathrooms',
                  type: 'int',
                ),
              )
            : Container(),
        property.list.details.floorNumber != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.apartment,
                  content: property.list.details.floorNumber.toString(),
                  name: 'floor',
                  type: 'int',
                ),
              )
            : Container(),
        property.list.details.greenTabo != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.apartment,
                  content: property.list.details.greenTabo == 1 ? 'Yes' : 'No',
                  name: 'green tabo',
                  type: 'bool',
                ),
              )
            : Container(),
        property.list.details.furnished != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.event_seat_rounded,
                  content: property.list.details.furnished == 1 ? 'Yes' : 'No',
                  name: 'furnished',
                  type: 'bool',
                ),
              )
            : Container(),
        property.list.details.poolSpace != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.pool,
                  content: property.list.details.poolSpace.toString(),
                  name: 'pool space',
                  type: 'int',
                ),
              )
            : Container(),
        property.list.details.poolDepth != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.pool,
                  content: property.list.details.poolDepth.toString(),
                  name: 'pool depth',
                  type: 'int',
                ),
              )
            : Container(),
        property.list.details.hasStadium != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.stadium,
                  content: property.list.details.hasStadium == 1 ? 'Yes' : 'No',
                  name: 'Stadium',
                  type: 'bool',
                ),
              )
            : Container(),
        property.list.details.hasParking != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.car_repair,
                  content: property.list.details.hasParking == 1 ? 'Yes' : 'No',
                  name: 'parking',
                  type: 'bool',
                ),
              )
            : Container(),
        property.list.details.hasWaterWell != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.water_drop,
                  content:
                      property.list.details.hasWaterWell == 1 ? 'Yes' : 'No',
                  name: 'water well',
                  type: 'bool',
                ),
              )
            : Container(),
        property.list.details.type != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomDetailsLisViewtItem(
                  propertyType: property.list.property.propertyableType,
                  propertyId: propertyId,
                  editable: editable,
                  icon: Icons.shopping_cart_outlined,
                  content: property.list.details.type!,
                  name: 'type',
                  type: 'string',
                ),
              )
            : Container(),
      ],
    );
  }
}
