import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/drawer/presentation/views/custom_drawer.dart';
import 'package:homy_hon/featchers/offices/presentations/manager/offices_cubit/offices_cubit.dart';
import '../../../../core/utils/textStyles.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_shimmer_widget.dart';
import 'widgets/custom_office_list_view_item.dart';

class OfficesView extends StatelessWidget {
  const OfficesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            title: "Offices",
            arrow_back: false,
            menu: true,
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BlocBuilder<OfficesCubit, OfficesState>(
                    builder: (context, state) {
                      if (state is OfficesLoading) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                  height: 135,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CustomShimmer(
                                        width: 0,
                                        height: 0,
                                        radius: 10,
                                      ),
                                    ),
                                  ));
                            });
                      } else if (state is OfficesSuccess) {
                        return CustomOfficeListViewItem(
                            officesModel:state.OfficesModel);
                      } else if (state is OfficesFailure)  {
                        return Column(children: [Center(child:Text(state.errMessage,style: TextStyles.NormalTextStyle,))],);
                      }
                      else{
                        return Column();
                      }
                    },
                  )))
        ],
      )),
    );
  }
}
