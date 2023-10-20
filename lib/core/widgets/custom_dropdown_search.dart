import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/search_property/data/models/governorates_model.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/filter_bloc/filter_bloc.dart';

import '../../constants.dart';
import '../../featchers/search_property/data/models/filter_model.dart';

class CustomDropDownSearch extends StatelessWidget {
  CustomDropDownSearch(
      {super.key,
      required this.items,
      required this.hintText,
      this.filterModel,
      this.governoratesModel});
  FilterModel? filterModel;
  final List<Object> items;
  final String hintText;
  final Governorates? governoratesModel;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: DropdownSearch(
          items: items,
          onChanged: (value) {
            if (hintText == 'Governorate') {
              if (governoratesModel != null) {
                String id = '1';
                governoratesModel!.list.forEach((key, mapValue) {
                  if (value == mapValue) {
                    id = key;
                  }
                });
                context.read<FilterBloc>().choosenGovernorate = int.parse(id);
                context.read<FilterBloc>().regions = null;
                context
                    .read<FilterBloc>()
                    .add(ChooseGovernorates(int.parse(id)));
              }
            }

            if (filterModel != null) {
              if (hintText == 'Region') {
                filterModel!.region = value.toString();
              } else if (hintText == 'Governorate') {
                filterModel!.governorate = value.toString();
              }

              filterModel!.createFilter();
              filterModel!.printFilterMap();
            }
          },
          popupProps: PopupProps.modalBottomSheet(
            itemBuilder: (context, item, isSelected) {
              return SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    item.toString(),
                    style: const TextStyle(color: kBlack),
                  ),
                ),
              );
            },
          ),
          dropdownButtonProps: const DropdownButtonProps(
            color: kWhite,
            iconSize: 3,
          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              filled: true,
              fillColor: kWhite,
            ),
          ),
          dropdownBuilder: (context, selectedItem) => selectedItem != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      selectedItem.toString(),
                      style: const TextStyle(color: kBlack),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      hintText,
                      style: TextStyle(
                          color: kGrey,
                          fontSize: MediaQuery.of(context).size.width * 0.033),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
