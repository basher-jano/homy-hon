
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homy_hon/core/utils/dialog/my_customButton.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_textfield.dart';
import 'package:homy_hon/featchers/edit_profile/presentation/manager/edit_profil_office/edit_profil_office_cubit.dart';
import 'package:homy_hon/featchers/edit_profile/presentation/views/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../../../core/config/edit_profile_office.dart';
import '../../../../core/config/edit_profile_user.dart';
import '../../../../core/config/user_information.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../main.dart';
import '../../../drawer/presentation/manager/show_profile_cubit/show_profile_cubit.dart';


class EditProfileOfficeView extends StatefulWidget {
  EditProfileOfficeView({super.key});

  @override
  State<EditProfileOfficeView> createState() => _EditProfileOfficeViewState();
}

File? _selectedImage;

class _EditProfileOfficeViewState extends State<EditProfileOfficeView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textController = TextEditingController();

  bool _validate = false;
  TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
                   CustomAppBar(title: "Edit Profile Office",arrow_back: true,menu: false,),

              SizedBox(
                height: MediaQuery.of(context).size.height / 75,
              ),
              Center(
                child: Column(children: [
                  _selectedImage != null
                      ? ImageWidget(
                          childwidget: ClipRRect(
                            borderRadius: BorderRadius.circular(200.0),
                            child: Image.file(_selectedImage!),
                          ),
                        )
                      : CustomImage(
                          image: '' ,
                          width: MediaQuery.of(context).size.height * 0.2,
                          height: MediaQuery.of(context).size.height * 0.2,
                          radius: MediaQuery.of(context).size.height * 0.2,
                        ),
                  Transform.translate(
                    offset: Offset(
                      MediaQuery.of(context).size.width / 5,
                      -MediaQuery.of(context).size.width / 8,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                          color: kLightBlue,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            _pickimage();
                          },
                          icon: const Icon(Icons.add),
                          iconSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              
              CustomTextField(
                label: "Password",
                keyboardType: TextInputType.emailAddress,
                onchanged: (value) {
                  EditProfileUser.user_password_edit = value;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyles.NormalTextStyle.copyWith(
                      color: kDarkBlue.withOpacity(0.5)),
                  labelText: "Password",
                  labelStyle:
                      TextStyles.NormalTextStyle.copyWith(color: kLightBlue),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 75,
              ),
              BlocBuilder<EditProfilOfficeCubit, EditProfilOfficeState>(
                builder: (context, state) {
                  if (state is EditProfileOfficeLoading) {
                    return Custombutton(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 13,
                        radius: 8,
                        color: kDarkBlue,
                        title: "Updating...",
                        ontap: () async {
                          BlocProvider.of<EditProfilOfficeCubit>(context)
                              .editProfileoffice();
                        },
                        textstyle: TextStyles.pageTitleTextStyle
                            .copyWith(color: kWhite));
                  } else  {
                    return Custombutton(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 13,
                        radius: 8,
                        color: kDarkBlue,
                        title: "Update",
                        ontap: () async {
                          await BlocProvider.of<EditProfilOfficeCubit>(context)
                              .editProfileoffice();
                          BlocProvider.of<ShowProfileCubit>(context)
                              .showProfile();
                        },
                        textstyle: TextStyles.pageTitleTextStyle
                            .copyWith(color: kWhite));
                  }
                },
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future _pickimage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
    EditProfileOffice.office_image_edit=_selectedImage;
    print( EditProfileOffice.office_image_edit);
  }
}
