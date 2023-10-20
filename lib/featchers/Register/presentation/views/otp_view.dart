import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_textfield.dart';
import 'package:homy_hon/featchers/Register/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:homy_hon/featchers/Register/presentation/manager/register_cubit/register_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/textStyles.dart';

class OtpView extends StatefulWidget {
  OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        if (state == OtpLoading()) {
          return Scaffold(
            body: Center(
              child: SpinKitWave(
                size: 50,
                color: kDarkBlue,
              ),
            ),
          );
        } else {
          return Form(
            key: _formKey,
            child: Scaffold(
              backgroundColor: kDarkBlue,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 11,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 11,
                      width: MediaQuery.of(context).size.height / 11,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 50),
                        child: SvgPicture.asset(
                          "assets/images/otp.svg",
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Verify your email",
                      style: TextStyles.logoTextStyle.copyWith(color: kWhite),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Text(
                      "we need to send OTP to authenticate your email",
                      style: TextStyles.NormalTextStyle.copyWith(
                          color: kWhite, fontSize: 14),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextField(
                              controller: _textController,
                              label: "Email",
                              keyboardType: TextInputType.emailAddress,
                              onchanged: (value) {
                                BlocProvider.of<RegisterCubit>(context).email =
                                    value;
                              },
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyles.NormalTextStyle.copyWith(
                                    color: kDarkBlue),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      // Update border color based on validation
                                      ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Email is required";
                                }
                                if (!value.contains('@')) {
                                  return "Please enter a valid email address";
                                }
                                if (value.startsWith('@') ||
                                    value.endsWith('@')) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Custombutton(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 15,
                              radius: 8,
                              color: kDarkBlue,
                              title: "Next",
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<OtpCubit>(context).sendOtp(
                                      BlocProvider.of<RegisterCubit>(context)
                                          .email);
                                  GoRouter.of(context).push(
                                    AppRouter.kVerficationCode,
                                  );
                                } else {
                                  setState(() {
                                    _validate = true;
                                  });
                                }
                              },
                              textstyle: TextStyles.pageTitleTextStyle
                                  .copyWith(color: kWhite)),
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
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// import 'package:flutter/material.dart';

// class OtpView extends StatefulWidget {
//   @override
//   _OtpViewState createState() => _OtpViewState();
// }

// class _OtpViewState extends State<OtpView> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _textController = TextEditingController();
//   bool _validate = false;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             controller: _textController,
//             decoration: InputDecoration(
//               labelText: 'Enter some text',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: _validate ? Colors.green : Colors.red,
//                 ),
//               ),
//             ),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 print('Yes');
//               } else {
//                 setState(() {
//                   _validate = true;
//                 });
//                 print('No');
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }
