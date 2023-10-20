import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_textfield.dart';
import 'package:homy_hon/featchers/Register/presentation/manager/otp_cubit/otp_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/textStyles.dart';
import '../manager/register_cubit/register_cubit.dart';

class VerficationCodeView extends StatelessWidget {
  const VerficationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();

    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kDarkBlue,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
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
                  "OTP",
                  style: TextStyles.logoTextStyle.copyWith(color: kWhite),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "please enter the OTP send to your email",
                  style: TextStyles.NormalTextStyle.copyWith(
                      color: kWhite, fontSize: 15),
                ),
                const SizedBox(
                  height: 80,
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
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                          child: OTPTextField(
                              controller: otpController,
                              length: 5,
                              width: MediaQuery.of(context).size.width / 1.5,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldWidth: 45,
                              fieldStyle: FieldStyle.box,
                              outlineBorderRadius: 15,
                              style: TextStyle(fontSize: 17, color: kDarkBlue),
                              onChanged: (pin) {
                                // print("Changed: " + pin);
                              },
                              onCompleted: (pin) {
                                print("Completed++++++++++++++++++: " + pin);
                                print(BlocProvider.of<OtpCubit>(context).otp);
                                if (pin ==
                                    BlocProvider.of<OtpCubit>(context)
                                        .otp
                                        .toString()) {
                                  GoRouter.of(context).push(
                                    AppRouter.kRegisterView,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(220)),
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Center(
                                            child: Text(
                                              "Wrong OTP",
                                              style: TextStyles.NormalTextStyle
                                                  .copyWith(color: kWhite),
                                            ),
                                          ),
                                        ),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 20, 100),
                                      duration: Duration(seconds: 2),
                                      elevation: 0,
                                    ),
                                  );
                                  
                                }
                              })),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: Text("didn't receive an OTP?",
                              style: TextStyles.NormalTextStyle.copyWith(
                                  fontSize: 15))),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<OtpCubit>(context).sendOtp(
                                BlocProvider.of<RegisterCubit>(context).email);
                          },
                          child: Text(
                            "Resend OTP?",
                            style: TextStyles.underlinedTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
