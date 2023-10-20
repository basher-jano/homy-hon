import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_image_widget.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/edit_info_bloc/edit_info_bloc.dart';

class CustomDeletImageWidget extends StatelessWidget {
  const CustomDeletImageWidget({
    super.key,
    required this.imageList,
    required this.index,
    required this.property,
  });
  final int index;
  final List<String> imageList;
  final Property property;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<EditInfoBloc>().add(DeletePropertyImageEvent(
              imageList[index],
              property.list.property.propertyableType,
              property.list.property.id,
              index,
            ));
        print(imageList[index]);
      },
      child: Stack(
        children: [
          CustomImage(
            image: imageList[index],
            width: MediaQuery.of(context).size.width * 0.35,
            height: 100,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 100,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 38, 24).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Center(
                child: BlocConsumer<EditInfoBloc, EditInfoState>(
              listener: (context, state) {
                if (state is DeleteImageSuccess) {
                  if (index == state.index) {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.message,
                                  style: TextStyles.textStyle18,
                                ),
                              )),
                        ),
                      ),
                    );
                  }
                } else if (state is DeleteImageFailure) {
                  if (index == state.index) {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kWhite,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.message,
                                  style: TextStyles.textStyle18,
                                ),
                              )),
                        ),
                      ),
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is DeleteImageLoading) {
                  if (state.index == index) {
                    return const CircularProgressIndicator(
                      color: kWhite,
                    );
                  } else {
                    return const Icon(
                      Icons.delete_forever,
                      color: kWhite,
                      size: 50,
                    );
                  }
                } else {
                  return const Icon(
                    Icons.delete_forever,
                    color: kWhite,
                    size: 50,
                  );
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
