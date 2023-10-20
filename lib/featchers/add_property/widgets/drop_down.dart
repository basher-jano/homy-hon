// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';

import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

class DropDown extends StatefulWidget {
  final List<String> governoratesList;
  final bool? isGovernortaes;
  String? dropdownValue;
  DropDown(
      {Key? key,
      required this.governoratesList,
      this.isGovernortaes,
      this.dropdownValue})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
// Step 2.
    return BlocBuilder<AddpropertyBloc, AddpropertyState>(
      builder: (context, state) {
        return SizedBox(
          height: 26,
          width: double.infinity,
          child: DropdownButton<String?>(
            // Step 3.

            value: widget.dropdownValue,
            isExpanded: true,
            // Step 4.
            underline: const SizedBox(),
            dropdownColor: kLightBlue,

            borderRadius: BorderRadius.circular(20),
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: kWhite,
              size: 24,
            ),
            items: widget.governoratesList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                onTap: () {
                  if (widget.isGovernortaes!) {
                    context.read<AddpropertyBloc>().regionvalue = null;
                    context.read<AddpropertyBloc>().add(GetRegionsEvent(
                        widget.governoratesList.indexOf(value) + 1));
                  } else {
                    context.read<AddpropertyBloc>().add(GetRegionId(
                        index: widget.governoratesList.indexOf(value)));
                  }
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: value == widget.dropdownValue
                          ? Colors.transparent
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(value,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyles.textStyle16
                                    .copyWith(color: kWhite)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue;
                if (widget.isGovernortaes!) {
                  context.read<AddpropertyBloc>().government = newValue;
                  context.read<AddpropertyBloc>().regionvalue = null;
                }
                if (!widget.isGovernortaes!) {
                  context.read<AddpropertyBloc>().regionvalue = newValue;
                }
                print(widget.dropdownValue);
              });
            },
          ),
        );
      },
    );
  }
}
