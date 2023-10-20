import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/widgets/property/custom_my_properties_list_view%20copy.dart';
import 'package:homy_hon/featchers/drawer/presentation/views/custom_drawer.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/my_properties_cubit/my_properties_cubit.dart';

class MyPropertiesView extends StatelessWidget {
  const MyPropertiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPropertiesCubit, MyPropertiesState>(
      builder: (context, state) {
        if(BlocProvider.of<MyPropertiesCubit>(context).myProperty!=null){
          SafeArea(
            child: Scaffold(
                endDrawer: CustomDrawer(),
                body: Column(
                  children: [
                    CustomAppBar(
                      title: 'My Properties',
                      menu: true,
                      arrow_back: false,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MyPropertiesListView(
                            editable: true,
                            onRefresh: () async {
                              BlocProvider.of<MyPropertiesCubit>(context)
                                  .fetchMyProperties();
                            },
                            properties:
                               BlocProvider.of<MyPropertiesCubit>(context).myProperty!),
                      ),
                    ),
                  ],
                )));
        }
        if(state is MyPropertiesSuccess){
return SafeArea(
            child: Scaffold(
                endDrawer: CustomDrawer(),
                body: Column(
                  children: [
                    CustomAppBar(
                      title: 'My Properties',
                      menu: true,
                      arrow_back: false,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MyPropertiesListView(
                            editable: true,
                            onRefresh: () async {
                              BlocProvider.of<MyPropertiesCubit>(context)
                                  .fetchMyProperties();
                            },
                            properties:
                               state.MyProperties),
                      ),
                    ),
                  ],
                )));
        }
        else if(state is MyPropertiesFailure){
              return Center(child: Text(state.errmessage),);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
