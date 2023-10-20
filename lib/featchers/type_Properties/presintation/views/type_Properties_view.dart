import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/type_list_View.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_shimmer_widget.dart';
import '../../../../core/widgets/property/custom_properties_list_view.dart';
import '../../../home_page/presentetion/manager/types/types_cubit.dart';
import '../../../my_properties/presintation/manager/my_properties_cubit/my_properties_cubit.dart';

class TypePropertiesView extends StatelessWidget {
  const TypePropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPropertiesCubit, MyPropertiesState>(
      builder: (context, state) {
        if (state is TypedPropertiesLoading) {
          return SafeArea(
              child: Scaffold(
                  body: Column(
            children: [
              CustomAppBar(
                title: BlocProvider.of<MyPropertiesCubit>(context).type,
                menu: true,
                arrow_back: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomShimmer(
                            height: 125,
                            width: MediaQuery.of(context).size.width * 0.8,
                            radius: 10,
                          ));
                    },
                  ),
                ),
              ),
            ],
          )));
        } else {
          return SafeArea(
              child: Scaffold(
                  body: Column(
            children: [
              CustomAppBar(
                title: BlocProvider.of<MyPropertiesCubit>(context).type,
                menu: true,
                arrow_back: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: PropertiesListView(
                      editable: false,
                      properties: BlocProvider.of<MyPropertiesCubit>(context)
                          .typerespose),
                ),
              ),
            ],
          )));
        }
      },
    );
  }
}
