import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view_item.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/my_properties/presintation/manager/my_properties_cubit/my_properties_cubit.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

class MyPropertiesListView extends StatelessWidget {
  MyPropertiesListView({
    super.key,
    required this.properties,
    required this.editable,
    required this.onRefresh,
  });
  final MyProperties? properties;
  final Future<void> Function() onRefresh;
  bool editable;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: properties == null ? 1 : properties!.list.length,
        itemBuilder: (context, index) {
          if (properties == null) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  PropertyItem(
                    id: properties!.list[index].id,
                    name: properties!.list[index].regionName,
                    image: properties!.list[index].firstImage!,
                    location:
                        '${properties!.list[index].governorateName}, ${properties!.list[index].regionName}',
                    prise: properties!.list[index].price.toString(),
                    status: properties!.list[index].rentSale,
                    type: properties!.list[index].propertyableType,
                    editable: true,
                  ),
                  editable == true
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              context.read<MyPropertiesCubit>().delteproperty(
                                  properties!.list[index].propertyableType,
                                  properties!.list[index].id);
                            },
                            child: Icon(
                              Icons.delete,
                              color: kRed,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
