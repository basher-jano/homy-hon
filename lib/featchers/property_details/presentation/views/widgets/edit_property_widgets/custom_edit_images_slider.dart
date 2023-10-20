import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/dialog/my_customButton.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_image_widget.dart';
import 'package:homy_hon/featchers/add_property/widgets/pick_image.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/edit_info_bloc/edit_info_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/custon_delete_image_widget.dart';

class CustomEditImagesSlider extends StatelessWidget {
  CustomEditImagesSlider({
    super.key,
    required this.imageList,
    required this.property,
  });
  Future<File?> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // phootListFunc(_image!);
        print(_image);
        return _image;
      } else {
        print('No image selected.');
        return null;
      }

      // ignore: use_build_context_synchronously
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  File? _image;

  final Property property;
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == imageList.length) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 60),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 100,
                decoration: BoxDecoration(
                  color: kGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocConsumer<EditInfoBloc, EditInfoState>(
                  listener: (context, state) {
                    if (state is PickImageSuccess) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: Stack(
                            children: [
                              Container(
                                color: kBlack,
                                child: Image.file(state.image),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            context.read<EditInfoBloc>().add(
                                                  UploadImageEvent(
                                                      image: _image!,
                                                      propertyId: property
                                                          .list.property.id,
                                                      propertyType: property
                                                          .list
                                                          .property
                                                          .propertyableType),
                                                );
                                          },
                                          backgroundColor: kGrey,
                                          child: BlocBuilder<EditInfoBloc,
                                              EditInfoState>(
                                            builder: (context, state) {
                                              if (state is UploadImageLoading) {
                                                return const CircularProgressIndicator(
                                                  color: kWhite,
                                                );
                                              } else {
                                                return const Icon(
                                                  Icons.send_rounded,
                                                  color: kWhite,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    if (state is UploadImageSuccess) {
                      Navigator.pop(context);
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
                    if (state is UploadImageFailure) {
                      Navigator.pop(context);
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
                  },
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: kWhite.withOpacity(0.95),
                                      borderRadius: BorderRadius.circular(10)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 100,
                                        child: GestureDetector(
                                          onTap: () async {
                                            File? image;
                                            image = await _pickImage(
                                                ImageSource.camera);
                                            if (image != null) {
                                              context
                                                  .read<EditInfoBloc>()
                                                  .add(PickImageEvent(image));
                                              _image = image;
                                            }
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kGrey),
                                            child: const Icon(
                                              Icons.camera_alt,
                                              color: kWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: 100,
                                        child: GestureDetector(
                                          onTap: () async {
                                            File? image;
                                            image = await _pickImage(
                                                ImageSource.gallery);
                                            if (image != null) {
                                              context
                                                  .read<EditInfoBloc>()
                                                  .add(PickImageEvent(image));
                                              _image = image;
                                            }
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kGrey),
                                            child: const Icon(
                                              Icons.browse_gallery_outlined,
                                              color: kWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add_a_photo_rounded,
                          color: kGrey,
                          size: 65,
                        ));
                  },
                ),
              ),
            );
          } else {
            return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomDeletImageWidget(
                  imageList: imageList,
                  index: index,
                  property: property,
                ));
          }
        },
      ),
    );
  }
}
