import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/featchers/drawer/data/models/profile_model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/failures.dart';
import '../../../../data/remote_date/api_handler/links.dart';
import '../../../../main.dart';
import 'drawer_repo.dart';

class DrawerRepoImpl implements DrawerRepo {
  Dio dio = Dio();

  // var token = myBox!.get(kToken);
 
  @override
  Future<Either<Failure, ProfileModel>> showProfile() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    print("-------token-------");
    print(token);
     print("-------token-------");

    var response = await dio.get('${Links.baseUrl}api/accounts/show/',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.statusCode == 200 && response.data['Status'] == 'Success') {
      var result = ProfileModel.fromJson(response.data);
      print(response.data);

      handelUserInfo(result);

      return Right(result);
    } else {
      return left(ServerFailure(response.data['message']));
    }
  }

  void handelUserInfo(ProfileModel res) async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
   
      UserInformation.USER_ACCOUNT_EMAIL = res.list?.account?.email??"";
      UserInformation.USER_ACCOUNT_FIRST_NAME = res.list?.account?.firstName??"";
      UserInformation.USER_ACCOUNT_PHONE = res.list?.account?.phoneNumber.toString()??"0";
      UserInformation.USER_ACCOUNT_LAST_NAME = res.list?.account?.lastName??"";
      UserInformation.USER_BIRTHDATE = res.list?.user?.birthdate??'';
      UserInformation.USER_GENDER = res.list?.user?.gender??"";
      UserInformation.USER_IMAGE=res.list!.image??"";
      prefs.setString("user_image", UserInformation.USER_IMAGE as String);
      prefs.setString("account_email", UserInformation.USER_ACCOUNT_EMAIL);
     prefs.setString("account_first_name", UserInformation.USER_ACCOUNT_FIRST_NAME);
     prefs.setString("account_phone", UserInformation.USER_ACCOUNT_PHONE);
     prefs.setString("account_last_name", UserInformation.USER_ACCOUNT_LAST_NAME);
     prefs.setString("user_birthdate", UserInformation.USER_BIRTHDATE);
      prefs.setString("user_gender", UserInformation.USER_GENDER);
    }

}
