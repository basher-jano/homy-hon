import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_enum.dart';
import 'package:homy_hon/core/utils/dialog/error_dialog.dart';
import 'package:homy_hon/featchers/Login/data/repos/add_property_repo.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  int i = 0;
  List<String> photoList = [];
  // Future<List<String>> phootListFunc(File image) async {
  //   (await AddPropertyRepo.UploadPhoto(image)).fold((l) => null, (r) {
  //     photoList.add(r);
  //     i = i + 1;
  //   });
  //   if (i > 2) {
  //     print(photoList);
  //     (await AddPropertyRepo.addProperty(photoList)).fold((l) => null, (r) {
  //       photoList.add(r);
  //       i = i + 1;
  //     });
  //   }
  //   print(photoList);

  //   return photoList;
  // }

  Future _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          // phootListFunc(_image!);
          print(_image);
        } else {
          print('No image selected.');
        }
      });
      // ignore: use_build_context_synchronously
      context.read<AddpropertyBloc>().add(UploadImageEvent(image: _image));
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddpropertyBloc, AddpropertyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Image Picker'),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _image == null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    )
                  : Container(
                      color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )),
              InkWell(
                onTap: () {
                  if (state.screenNavigate == ScreenNavigate.shop) {
                    context.read<AddpropertyBloc>().addShopPrams.selectedPhoto =
                        context.read<AddpropertyBloc>().photoList;
                    print(context
                        .read<AddpropertyBloc>()
                        .addShopPrams
                        .selectedPhoto!
                        .length);
                    if (context
                            .read<AddpropertyBloc>()
                            .addShopPrams
                            .selectedPhoto!
                            .length <
                        5) {
                      ErrorDialog.openDialog(
                          context, "sorry you should chosse at least 5 image");
                    } else {
                      Navigator.of(context).pop();
                    }
                  }
                  if (state.screenNavigate == ScreenNavigate.house) {
                    context
                            .read<AddpropertyBloc>()
                            .addPropertyPrams
                            .selectedPhoto =
                        context.read<AddpropertyBloc>().photoList;
                    print(context
                        .read<AddpropertyBloc>()
                        .addPropertyPrams
                        .selectedPhoto!
                        .length);

                    if (context
                            .read<AddpropertyBloc>()
                            .addPropertyPrams
                            .selectedPhoto!
                            .length <
                        5) {
                      ErrorDialog.openDialog(
                          context, "sorry you should chosse at least 5 image");
                    } else {
                      Navigator.of(context).pop();
                    }
                  }
                  if (state.screenNavigate == ScreenNavigate.farm) {
                    print(context.read<AddpropertyBloc>().photoList);
                    context.read<AddpropertyBloc>().addFarmPrams.selectedPhoto =
                        context.read<AddpropertyBloc>().photoList;
                    print(context
                        .read<AddpropertyBloc>()
                        .addFarmPrams
                        .selectedPhoto!
                        .length);
                    if (context
                            .read<AddpropertyBloc>()
                            .addFarmPrams
                            .selectedPhoto!
                            .length <
                        5) {
                      ErrorDialog.openDialog(
                          context, "sorry you should chosse at least 5 image");
                    } else {
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: Container(
                  color: kblue,
                  height: 40,
                  width: 120,
                  child: const Center(
                    child: Text("continue"),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: 'Pick Image from Gallery',
            child: Icon(Icons.photo),
          ),
        );
      },
    );
  }
}
