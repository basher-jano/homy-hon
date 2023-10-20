import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/edit_profile_office.dart';
import '../../../../core/config/edit_profile_user.dart';
import '../../../../data/remote_date/api_handler/links.dart';
import '../../../../main.dart';
import '../model/edit_profile_model/edit_profile_model.dart';
import '../model/edit_profile_user_error/edit_profile_user_error_model.dart';
import 'edit_profile_repo.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  @override
  Dio dio = Dio();

  @override
  Future<Either<EditProfileUserErrorModel, EditProfileModel>>
      editProfile() async {
        var image;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(EditProfileUser.user_image_edit!=null){
String fileName = EditProfileUser.user_image_edit?.path.split('/').last??'';
    image = await MultipartFile.fromFile(EditProfileUser.user_image_edit.path, filename: fileName);
    }
    
    Map<String, dynamic> getKeyValueMap()  {
      Map<String, dynamic> myMap = {};
      if (EditProfileUser.user_email_edit != null &&
          EditProfileUser.user_email_edit !=
              UserInformation.USER_ACCOUNT_EMAIL) {
        myMap['email'] = EditProfileUser.user_email_edit;
      }
      if (EditProfileUser.user_gender_edit != null &&
          EditProfileUser.user_gender_edit != UserInformation.USER_GENDER) {
        myMap['gender'] = EditProfileUser.user_gender_edit;
      }
      if (EditProfileUser.user_first_name_edit != null &&
          EditProfileUser.user_first_name_edit !=
              UserInformation.USER_ACCOUNT_FIRST_NAME) {
        myMap['firstName'] = EditProfileUser.user_first_name_edit;
      }

      if (EditProfileUser.user_last_name_edit != null &&
          EditProfileUser.user_last_name_edit !=
              UserInformation.USER_ACCOUNT_LAST_NAME) {
        myMap['lastName'] = EditProfileUser.user_last_name_edit;
      }
      if (EditProfileUser.user_phone_edit != null &&
          EditProfileUser.user_phone_edit !=
              UserInformation.USER_ACCOUNT_PHONE) {
        myMap['phoneNumber'] = EditProfileUser.user_phone_edit;
      }
      if (EditProfileUser.user_birthdate_edit != null &&
          EditProfileUser.user_birthdate_edit != UserInformation.USER_BIRTHDATE)
        myMap['birthdate'] = EditProfileUser.user_birthdate_edit;
      if (EditProfileUser.user_password_edit != null &&
          EditProfileUser.user_password_edit != UserInformation.USER_PASSWORD)
        myMap['password'] = EditProfileUser.user_password_edit;
        if(EditProfileUser.user_image_edit!=null&&EditProfileUser.user_image_edit!=UserInformation.USER_IMAGE)
        myMap["image"] = image;
      return myMap;
    }

    print(getKeyValueMap());

    FormData formData = FormData.fromMap(getKeyValueMap());
   

    print("editProfile++");
    print(getKeyValueMap());

    var response = await dio.post('${Links.baseUrl}api/accounts/update',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));
    print(response.statusCode);
    print(response.data);
    if (response.data['Code'] == 200 && response.data['Status'] == 'Success') {
      var result = EditProfileModel.fromJson(response.data);
      return Right(result);
    } else {
      var result = EditProfileUserErrorModel.fromJson(response.data);
      return Left(result);
    }
  }
  
  @override
  Future<Either<EditProfileUserErrorModel, EditProfileModel>> editProfileoffice() async{
    var image;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if(EditProfileOffice.office_image_edit!=null){
    String fileName = EditProfileOffice.office_image_edit?.path.split('/').last??'';
    image = await MultipartFile.fromFile(EditProfileOffice.office_image_edit.path, filename: fileName);
    }
    
    Map<String, dynamic> getKeyValueMap()  {
      Map<String, dynamic> myMap = {};
      
      if (EditProfileOffice.office_password_edit != null)
        myMap['password'] = EditProfileOffice.office_password_edit;
        if(EditProfileOffice.office_image_edit!=null)
        myMap["image"] = image;
      return myMap;
    }

    print(getKeyValueMap());

    FormData formData = FormData.fromMap(getKeyValueMap());
    print("editProfile++");
    print(getKeyValueMap());

    var response = await dio.post('${Links.baseUrl}api/accounts/update',
        data: formData,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));
    print(response.statusCode);
    print(response.data);
    if (response.data['Code'] == 200 && response.data['Status'] == 'Success') {
      var result = EditProfileModel.fromJson(response.data);
      return Right(result);
    } else {
      var result = EditProfileUserErrorModel.fromJson(response.data);
      return Left(result);
    }
  }
}
