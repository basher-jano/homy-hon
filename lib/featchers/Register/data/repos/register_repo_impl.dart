import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:homy_hon/featchers/Register/data/models/send_otp_modle.dart';
import 'package:homy_hon/featchers/Register/data/models/send_otp_fail/send_otp_fail_model.dart';
import 'package:homy_hon/featchers/Register/data/repos/register_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/remote_date/api_handler/links.dart';
import '../models/error_register_model/error_register_model.dart';
import '../models/error_register_model/message.dart';
import '../models/register_model/register_model.dart';

class RegisterRepoImpl implements RegisterRepo {
  String? registerMsg;

  @override
  Future<Either<ErrorRegisterModel, RegisterModel>> register(User user) async {
    print("xxqxxxxxxqxxxxxxxqxxxxxxxxqxxxqxxxxxqxxxxxxqxxxxqxxxxx");

    try {
      Dio dio = Dio();

      FormData formData = FormData.fromMap({
        "firstName": user.first_name,
        "lastName": user.last_name,
        "email": user.email,
        "phoneNumber": user.phone,
        "password": user.password,
      });

      print(user.first_name +
          " , " +
          user.last_name +
          " , " +
          user.email +
          " , " +
          user.phone +
          " , " +
          user.password);
      var response = await dio.post(
        '${Links.baseUrl}api/register',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );
      print(response.statusCode);
      print(response.data);
      if (response.data['Code'] == 200 &&
          response.data['Status'] == "Success") {
        print("If statement");
        print(response.data);
        var res = RegisterModel.fromJson(response.data);
        registerMsg = res.message;

        UserInformation.TYPE_USER = 'user';
        UserInformation.USER_TOKEN = res.token!;
        UserInformation.USER_ACCOUNT_EMAIL = res.account!.email!;
        UserInformation.USER_ACCOUNT_FIRST_NAME = res.account!.firstName!;
        UserInformation.USER_ACCOUNT_PHONE = res.account!.phoneNumber!;
        UserInformation.USER_ACCOUNT_LAST_NAME = res.account!.lastName!;
        UserInformation.USER_ID = res.account!.id!;
SharedPreferences prefs = await SharedPreferences.getInstance();
     
        prefs.setString(kTypeUser, UserInformation.TYPE_USER);
         prefs.setString(kToken, UserInformation.USER_TOKEN);
        prefs.setString(kUserAccountEmail, UserInformation.USER_ACCOUNT_EMAIL);
         prefs.setString(kUserAccountFirstName, UserInformation.USER_ACCOUNT_FIRST_NAME);
        prefs.setString(kUserAccountPhone, UserInformation.USER_ACCOUNT_PHONE);
         prefs.setString(kUserAccountLastName, UserInformation.USER_ACCOUNT_LAST_NAME);
         prefs.setInt(kUserId, UserInformation.USER_ID);

        return right(res);
      } else if (response.data['Code'] == 422 &&
          response.data['Status'] == "Failed") {
        print("else if statement");

        print(response.data);
        var errRes = ErrorRegisterModel.fromJson(response.data);
        return left(errRes);
      } else {
        print("else  statement");
        var errresp = ErrorRegisterModel.fromJson(response.data);
        print(response.data);
        return left(errresp);
      }
    } catch (e) {
      print("=======CATCH=======");
      print(e.toString());
      return left(ErrorRegisterModel());
    }
  }

  /// ******************************************
  var msg;
  String otp = "0";
  SendOtpModle sendOtpModle = SendOtpModle();

  @override
  Future<Either<Failure, SendOtpModle>> sendOtp(email) async {
    print("=====sending Otp ... =======");
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        "email": email,
      });
      Response response = await dio.post(
        '${Links.baseUrl}api/sendCode',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        sendOtpModle = SendOtpModle.fromJson(response.data);
        msg = sendOtpModle.message;
        otp = sendOtpModle.code.toString();
        print("/*/*/*/*/*/*/**/*/*/");
        print(response.statusCode);
        print(response.data);
        print(msg);
        print(otp);
        print("/*/*/*/*/*/*/**/*/*/");
        return right(sendOtpModle);
      } else {
        print("+-+-+-+-+-+-+-+-+-+-+-");
        var fres = SendOtpFailModel.fromJson(response.data);
        msg = sendOtpModle.message;
        print(response.statusCode);
        print(response.data);
        print(msg);
        print("+-+-+-+-+-+-+-+-+-+-+-");
        return left(ServerFailure("try again"));
      }
    } catch (e) {
      print(e.toString());
      return left(ServerFailure("try again"));
    }
  }
}
