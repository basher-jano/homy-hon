import 'package:flutter/material.dart';
import 'package:homy_hon/featchers/advertisements/presentation/views/widgets/advertisements_list_view_item.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

import '../../../../my_properties/data/models/my_property_model.dart';
import 'newest_property_list_view_item.dart';

class NewestPropertyListView extends StatelessWidget {
  const NewestPropertyListView({super.key, required this.properties});
  final MyProperties? properties;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: properties == null ? 1 : properties!.list.length,
        itemBuilder: (BuildContext context, int index) {
          if (properties == null) {
            return Container();
          } else {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: NewestPropertyListViewItem(
                image:properties!.list[index].firstImage??'',
                    
                location: properties!.list[index].governorateName +
                    ', ' +
                    properties!.list[index].regionName +
                    '',
                name: properties!.list[index].regionName,
                prise: properties!.list[index].price.toString(),
                status: properties!.list[index].rentSale,
                type: properties!.list[index].propertyableType,
                id: properties!.list[index].id,
                editable: false,
              ),
            );
          }
        });
  }
}
