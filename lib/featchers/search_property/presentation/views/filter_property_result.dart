import 'package:flutter/material.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

class FilterPropertyResult extends StatelessWidget {
  const FilterPropertyResult({super.key, required this.properties});
  final Properties properties;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBar(title: 'Filter result', arrow_back: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: properties.list.length == 0
                  ? const Center(
                      child: Text(
                        "There is no properties",
                        style: TextStyles.textStyle20,
                      ),
                    )
                  : PropertiesListView(
                      editable: false,
                      properties: properties,
                    ),
            ),
          )
        ],
      )),
    );
  }
}
