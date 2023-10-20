import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homy_hon/core/utils/dialog/my_customButton.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_textfield.dart';
import 'package:homy_hon/featchers/edit_profile/presentation/manager/edit_profile_user_cubit/edit_profile_cubit.dart';
import 'package:homy_hon/featchers/edit_profile/presentation/views/widget/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../../../core/config/edit_profile_user.dart';
import '../../../../core/config/user_information.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import '../../../../main.dart';
import '../../../drawer/presentation/manager/show_profile_cubit/show_profile_cubit.dart';

class EditProfileUserView extends StatefulWidget {
  EditProfileUserView({super.key});

  @override
  State<EditProfileUserView> createState() => _EditProfileUserViewState();
}

File? _selectedImage;

class _EditProfileUserViewState extends State<EditProfileUserView> {
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
              CustomAppBar(title: "Edit Profile User", arrow_back: true),
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
                          image: UserInformation.USER_IMAGE.toString() ,
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
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'email : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        width: 180.0,
                        padding: 5.0,
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (value) {
                          EditProfileUser.user_email_edit = value;
                        },
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_ACCOUNT_EMAIL,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Gender : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        width: 180.0,
                        padding: 5.0,
                        label: "Gender",
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (value) {
                          EditProfileUser.user_gender_edit = value;
                        },
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_GENDER,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'First Name : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        width: 180.0,
                        padding: 5.0,
                        label: "First Name",
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (value) {
                          EditProfileUser.user_first_name_edit = value;
                        },
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_ACCOUNT_FIRST_NAME,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Last Name : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        padding: 5.0,
                        width: 180.0,
                        label: "Last Name",
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (value) {
                        EditProfileUser.user_last_name_edit = value;
                        },
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_ACCOUNT_LAST_NAME,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Phone : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        width: 180.0,
                        label: "Phone",
                        keyboardType: TextInputType.emailAddress,
                        onchanged: (value) {
                          EditProfileUser.user_phone_edit = value;
                        },
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_ACCOUNT_PHONE,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Birthdate : ',
                          style: TextStyles.NormalTextStyle,
                        ),
                      ),
                      CustomTextField(
                        onchanged: (value) {},
                        width: 180.0,
                        readonly: true,
                        controller:
                            dateController, //editing controller of this TextField
                        decoration: InputDecoration(
                          labelText: UserInformation.USER_BIRTHDATE,
                          labelStyle: TextStyles.NormalTextStyle.copyWith(
                              color: kLightBlue),
                        ),

                        ontap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(
                                  1900), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              dateController.text = formattedDate;
                              EditProfileUser.user_birthdate_edit = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ],
                  )
                ],
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
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  if (state is EditProfileLoading) {
                    return Custombutton(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 13,
                        radius: 8,
                        color: kDarkBlue,
                        title: "Updating...",
                        ontap: () async {
                          BlocProvider.of<EditProfileCubit>(context)
                              .editProfile();
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
                          await BlocProvider.of<EditProfileCubit>(context)
                              .editProfile();
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
    EditProfileUser.user_image_edit=_selectedImage;
  }
}
