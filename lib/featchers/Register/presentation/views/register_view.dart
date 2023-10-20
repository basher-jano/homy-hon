import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/featchers/Register/presentation/manager/register_cubit/register_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/textStyles.dart';
import '../../../../core/widgets/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
   
return Scaffold(
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 20),
                      child: Text(
                        "Sign up",
                        style: TextStyles.LargelogoTextStyle.copyWith(
                            color: kDarkBlue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.asset(
                      "assets/images/circels.png",
                      width: 200,
                      height: 300,
                    )
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CustomTextField(
                          label: "First Name",
                          keyboardType: TextInputType.text,
                          onchanged: (value) {
                            BlocProvider.of<RegisterCubit>(context).firstname =
                                value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return "First Name is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "First Name",
                            labelStyle: TextStyles.NormalTextStyle.copyWith(
                                color: kDarkBlue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _validate
                                    ? Colors.transparent
                                    : Colors
                                        .red, // Update border color based on validation
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CustomTextField(
                          label: "Last Name",
                          keyboardType: TextInputType.emailAddress,
                          onchanged: (value) {
                            BlocProvider.of<RegisterCubit>(context).lastname =
                                value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Last Name is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            labelStyle: TextStyles.NormalTextStyle.copyWith(
                                color: kDarkBlue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _validate
                                    ? Colors.transparent
                                    : Colors
                                        .red, // Update border color based on validation
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CustomTextField(
                          label: "Phone",
                          keyboardType: TextInputType.phone,
                          onchanged: (value) {
                            BlocProvider.of<RegisterCubit>(context).phone =
                                value;
                          },
                          decoration: InputDecoration(
                            labelText: "Phone",
                            labelStyle: TextStyles.NormalTextStyle.copyWith(
                                color: kDarkBlue),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  // color: _validate
                                  //     ? Colors.transparent
                                  //     : Colors
                                  //         .red, // Update border color based on validation
                                  ),
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (value.length < 10) {
                              return 'Phone must be at least 10 diget long';
                            }
                            if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'Phone number not valid';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: CustomTextField(
                          label: "password",
                          keyboardType: TextInputType.visiblePassword,
                          onchanged: (value) {
                            BlocProvider.of<RegisterCubit>(context).password =
                                value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyles.NormalTextStyle.copyWith(
                                color: kDarkBlue),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _validate
                                    ? Colors.transparent
                                    : Colors
                                        .red, // Update border color based on validation
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Custombutton(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 13,
                          radius: 8,
                          color: kLightBlue,
                          title: "Sign up",
                          ontap: () async {
                            if (_formKey.currentState!.validate() == true) {
                              await BlocProvider.of<RegisterCubit>(context)
                                  .register();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    BlocProvider.of<RegisterCubit>(context)
                                        .registerMsg!,
                                    style: TextStyles.NormalTextStyle,
                                  ),
                                  duration: Duration(seconds: 2),
                                  // backgroundColor: Colors.red,
                                ),
                              );
                              if (BlocProvider.of<RegisterCubit>(context)
                                      .registerMsg ==
                                  "User registered successfully") {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kNavigationBar);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      BlocProvider.of<RegisterCubit>(context)
                                          .registerMsg!,
                                      style: TextStyles.NormalTextStyle,
                                    ),
                                    duration: Duration(seconds: 2),
                                    // backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            } else if (_formKey.currentState!.validate() ==
                                false) {
                              setState(() {
                                _validate = true;
                              });
                            }
                          },
                          textstyle: TextStyles.pageTitleTextStyle
                              .copyWith(color: kBlack)),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kLoginView);
                        },
                        child: const Center(
                          child: Text("Already have an account?",
                              style: TextStyles.underlinedTextStyle),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      );
   
   
      }
      
    );
  }
}
