import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/search_bloc/search_bloc.dart';

import '../../../../../constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: kWhite,
        child: Center(
          child: TextField(
            onChanged: (input) {
              print('input : ' + input);
              context.read<SearchBloc>().add(SearchForOfficeEvent(input));
            },
            textAlignVertical: TextAlignVertical.center,
            cursorColor: kDarkBlue,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
                color: kDarkBlue,
              ),
              hintText: 'Search for offices',
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w900,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: const TextStyle(
              color: kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
