import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/Login/data/models/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants.dart';
import '../../../../core/config/user_information.dart';
import '../../../../core/failures.dart';
import '../../../../core/utils/user.dart';
import '../../../../main.dart';
import 'login_repo.dart';
import 'package:dio/dio.dart';

class LoginRepoImple implements LoginRepo {
  String? loginMsg;
  Dio dio = Dio();

  @override
  Future<Either<Failure, LoginModel>> login(User user) async {
    print("********************************");
    try {
      FormData formData = FormData.fromMap({
        "email": user.email,
        "password": user.password,
      });
      print(user.email);
      print(user.password);
      var response = await dio.post(
        Links.baseUrl+"api/login",
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

      print(response.statusCode);
      print(response.data);

      if (response.data['Code'] == 200 &&
          response.data['Status'] == "Success") {
        print("If statement");
        var res = LoginModel.fromJson(response.data);
        loginMsg = res.message;
      await  handelUserInfo(res);
      //  SharedPreferences prefs = await SharedPreferences.getInstance();
      //   prefs.setString('token', res.token!);

        return right(res);
      } else if (response.data['Code'] == 406 &&
          response.data['Status'] == "Failed") {
        var res = LoginModel.fromJson(response.data);
        loginMsg = res.message;
        return left(ServerFailure(loginMsg!));
      } else {
        return left(ServerFailure("Try again"));
      }
    } catch (e) {
      print("-+-----CATCHEE--+-+");
      print(e.toString()+"+-");
      return left(ServerFailure("Server Error,Try again"));
    }
  }

  Future<void> handelUserInfo(LoginModel res)  async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
     
    if (res.accounts?.office == null) {
      print("@@@@@@@ I AM USER @@@@@");

      UserInformation.TYPE_USER = 'user';
      UserInformation.USER_TOKEN = res.token!;
      UserInformation.USER_ACCOUNT_EMAIL = res.accounts!.email!;
      UserInformation.USER_ACCOUNT_FIRST_NAME = res.accounts!.firstName!;
      UserInformation.USER_ACCOUNT_PHONE =res.accounts!.phoneNumber!.toString();
      UserInformation.USER_ACCOUNT_LAST_NAME = res.accounts!.lastName!;
      UserInformation.USER_ACCOUNT_ID = res.accounts!.id!;
      UserInformation.USER_ID = res.accounts!.user!.id!;
      UserInformation.USER_BIRTHDATE = res.accounts!.user!.birthdate;
      UserInformation.USER_GENDER = res.accounts!.user!.gender;
      

 

      prefs!.setString(kToken, res.token!);
      prefs!.setString(kTypeUser, UserInformation.TYPE_USER);
      prefs!.setString(kUserAccountEmail, UserInformation.USER_ACCOUNT_EMAIL);
      prefs!.setString(kUserAccountFirstName, UserInformation.USER_ACCOUNT_FIRST_NAME);
      prefs!.setString(kUserAccountPhone, UserInformation.USER_ACCOUNT_PHONE);
      prefs!.setString(kUserAccountLastName, UserInformation.USER_ACCOUNT_LAST_NAME);
      prefs!.setInt(kUserAccountId, UserInformation.USER_ACCOUNT_ID);
      prefs!.setInt(kUserId, UserInformation.USER_ID);
      prefs!.setString(kUserBirthdate, UserInformation.USER_BIRTHDATE);
      prefs!.setString(kUserGender, UserInformation.USER_GENDER);
    } else {
      print("@@@@@@@ I AM OFFICE @@@@@");

      UserInformation.OFFICE_TOKEN = res.token!;
      UserInformation.TYPE_USER = 'office';
      UserInformation.OFFICE_ACCOUNT_EMAIL = res.accounts!.email!;
      UserInformation.OFFICE_ACCOUNT_FIRST_NAME = res.accounts!.firstName!;
      UserInformation.OFFICE_ACCOUNT_PHONE =res.accounts!.phoneNumber!.toString();
      UserInformation.OFFICE_ACCOUNT_LAST_NAME = res.accounts!.lastName!;
      UserInformation.OFFICE_ACCOUNT_ID = res.accounts!.id!;
      UserInformation.OFFICE_ID = res.accounts!.office!.id!;
      UserInformation.OFFICE_NAME = res.accounts!.office!.officeName!;
      UserInformation.OFFICE_ADDRESS = res.accounts!.office!.address!;
      UserInformation.OFFICE_TELEPHONE = res.accounts!.office!.telephone!;
      UserInformation.OFFICE_RAGION_ID = res.accounts!.office!.regionId!;
      UserInformation.OFFICE_RATING = res.accounts!.office!.rating!;
   
      prefs!.setString(kToken, res.token!);
      prefs!.setString(kTypeUser, UserInformation.TYPE_USER);
       prefs!.setString(kOfficeAccountEmail, UserInformation.OFFICE_ACCOUNT_EMAIL);
       prefs!.setString(
          kOfficeAccountFirstName, UserInformation.OFFICE_ACCOUNT_FIRST_NAME);
      prefs!.setString(kPfficeAccountPhone, UserInformation.OFFICE_ACCOUNT_PHONE);
       prefs!.setString(
          kOfficeAccountLastName, UserInformation.OFFICE_ACCOUNT_LAST_NAME);
       prefs!.setInt(kOfficeAccountId, UserInformation.OFFICE_ACCOUNT_ID);
       prefs!.setInt(kOfficeId, UserInformation.OFFICE_ID);
       prefs!.setString(kOfficeName, UserInformation.OFFICE_NAME);
       prefs!.setString(kOfficeAddress, UserInformation.OFFICE_ADDRESS);
       prefs!.setInt(kOfficeTelephone, UserInformation.OFFICE_TELEPHONE);
       prefs!.setInt(kOfficeRagionId, UserInformation.OFFICE_RAGION_ID);
       prefs!.setInt(kOfficeRating, UserInformation.OFFICE_RATING);
    }
  }

  
  @override
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var response = await dio.get(Links.baseUrl + 'api/logout',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    print(response.statusCode);
    print(response.data);
  }
}
