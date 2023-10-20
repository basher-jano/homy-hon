import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/featchers/Login/data/repos/login_repo.dart';
import 'package:homy_hon/featchers/Login/data/repos/login_repo_impl.dart';
import 'package:homy_hon/featchers/Login/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/textStyles.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../main.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textController = TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LogintState>(
      builder: (context, state) {
        if (state == LoginLoading()) {
          return const Scaffold(
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 15),
                          child: Text(
                            "Login",
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: CustomTextField(
                            controller: _textController,
                            label: "Email",
                            keyboardType: TextInputType.emailAddress,
                            onchanged: (value) {
                              BlocProvider.of<LoginCubit>(context).email =
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: CustomTextField(
                            label: "password",
                            keyboardType: TextInputType.visiblePassword,
                            onchanged: (value) async{
                              BlocProvider.of<LoginCubit>(context).password =
                                  value;
                                  UserInformation.USER_PASSWORD=value;
                                     SharedPreferences prefs = await SharedPreferences.getInstance();
     
                                 prefs.setString('user_Password',value);
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Custombutton(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 13,
                            radius: 8,
                            color: kDarkBlue,
                            title: "Login",
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                await BlocProvider.of<LoginCubit>(context)
                                    .login();
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
                                             BlocProvider.of<LoginCubit>(context)
                                        .loginMsg! ,
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
                                
                                if (BlocProvider.of<LoginCubit>(context)
                                        .loginMsg ==
                                    "User logged in successfully") {
                                      
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kNavigationBar);
                                } 
                              } else {
                                setState(() {
                                  _validate = true;
                                });
                              }
                            },
                            textstyle: TextStyles.pageTitleTextStyle
                                .copyWith(color: kWhite)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kOtpView);
                          },
                          child: const Center(
                            child: Text("Dont have an account?",
                                style: TextStyles.underlinedTextStyle),
                          ),
                        )
                      ],
                    )
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
