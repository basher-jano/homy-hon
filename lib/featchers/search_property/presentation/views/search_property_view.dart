import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view.dart';
import 'package:homy_hon/core/widgets/property/custom_properties_list_view_item_loading.dart';
import 'package:homy_hon/featchers/offices/presentations/views/widgets/custom_office_list_view_item.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/search_bloc/search_bloc.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/widgets/search_page_app_bar.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/widgets/search_text_field.dart';

class SearchPropertyView extends StatefulWidget {
  SearchPropertyView({super.key});

  @override
  State<SearchPropertyView> createState() => _SearchPropertyViewState();
}

class _SearchPropertyViewState extends State<SearchPropertyView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SearchPageAppBar(),
            CupertinoSegmentedControl(
              children: const {
                0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('Offices')),
                1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('Properties')),
              },
              groupValue: context.read<SearchBloc>().officesOrProperies,
              onValueChanged: (value) {
                setState(() {
                  context.read<SearchBloc>().officesOrProperies = value;

                  if (context.read<SearchBloc>().officesOrProperies == 1 &&
                      context.read<SearchBloc>().properties == null) {
                    context.read<SearchBloc>().add(GetAllPropertiesEvent());
                  } else if (context.read<SearchBloc>().officesOrProperies ==
                          0 &&
                      context.read<SearchBloc>().offices == null) {
                    context.read<SearchBloc>().add(GetAllOfficesEvent());
                  }
                });
              },
            ),
            context.read<SearchBloc>().officesOrProperies == 0
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: SearchTextField(),
                  )
                : Container(),
            BlocBuilder<SearchBloc, SearchState>(
              bloc: context.read<SearchBloc>().offices == null
                  ? (context.read<SearchBloc>()..add(GetAllOfficesEvent()))
                  : null,
              builder: (context, state) {
                if (context.read<SearchBloc>().officesOrProperies == 0) {
                  if (context.read<SearchBloc>().offices != null) {
                    return  Expanded(
                        child:   CustomOfficeListViewItem(
                      officesModel: context.read<SearchBloc>().offices,
                    ))  ;
                  } else if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FailureState) {
                    return Text(state.errMsg);
                  } else {
                    return const Text('Something went wrong');
                  }
                } else {
                  if (context.read<SearchBloc>().properties != null) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: PropertiesListView(
                            editable: false,
                            onRefresh: () async {
                              context
                                  .read<SearchBloc>()
                                  .add(GetAllPropertiesEvent());
                            },
                            properties: context.read<SearchBloc>().properties!),
                      ),
                    );
                  } else if (state is LoadingState) {
                    return const PropertyItemLoading();
                  } else if (state is FailureState) {
                    return Text(state.errMsg);
                  } else {
                    return const Text('Something went wrong');
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
