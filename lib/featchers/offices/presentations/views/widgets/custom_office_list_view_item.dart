import 'package:flutter/material.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view_item.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/offices/presentations/views/widgets/custom_office_Item.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

class CustomOfficeListViewItem extends StatelessWidget {
  const CustomOfficeListViewItem({
    super.key,
    required this.officesModel,
  });
  final OfficesModel? officesModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: officesModel != null ? officesModel!.offices!.length : 1,
        itemBuilder: (context, index) {
          if (officesModel != null) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomOfficeItem(
                id: officesModel!.offices![index].id,
                account_id: officesModel!.offices![index].accountId,
                name: officesModel!.offices![index].officeName,
                image: officesModel!.offices![index].firstImage,
                location: "${officesModel!.offices![index].governorateName}" +
                    " ,${officesModel!.offices![index].regionName}",
                rating: officesModel!.offices![index].rating!.toDouble(),
                phone_number: officesModel!.offices![index].phoneNumber!,
              ),
            );
          }
        });
  }
}
