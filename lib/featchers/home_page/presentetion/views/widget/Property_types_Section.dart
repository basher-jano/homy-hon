import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/widget/type_list_View.dart';

import '../../../../../core/widgets/custom_shimmer_widget.dart';
import '../../manager/types/types_cubit.dart';

class PropertyTypeSection extends StatelessWidget {
  const PropertyTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypesCubit, TypesState>(
      builder: (context, state) {
        if (state is TypesLoading) {
          return SizedBox(
            height: 65,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) => const Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomShimmer(
                        height: 0,
                        width: 100,
                        radius: 10,
                      ),
                    )),
          );
        } else {
          return SizedBox(
              height: 65,
              child: TypeListView(
                  list: BlocProvider.of<TypesCubit>(context).typesList));
        }
      },
    );
  }
}
