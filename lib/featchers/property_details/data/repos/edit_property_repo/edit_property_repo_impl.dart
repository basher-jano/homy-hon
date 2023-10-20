import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/property_details/data/repos/edit_property_repo/edit_property_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPropertyRepoImpl implements EditPropertyRepo {

  @override
  Future<Either<String, String>> editPropertyInfo(
    int id,
    String key,
    String value,
    String propertyType,
  ) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    key = checkKey(key);
    int? intValue = null;
    intValue = checkBoolValue(value, intValue);

    print('$key:$value');
    print('$key:$intValue');
    print('api/property/$propertyType/update/$id');

    try {
      var response = await dio.post(
          '${Links.baseUrl}api/property/$propertyType/update/$id',
          data: FormData.fromMap({key: intValue ?? value}),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      try {
        var result = response.data["Message"];
        if (response.data['Status'] == 'Success') {
          return right(result);
        } else {
          return left(result);
        }
      } on Exception catch (e) {
        return left('Someting went wrong');
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, String>> deletePropertyImage(
      {required int id,
      required String image,
      required String propertyType}) async {
    Dio dio = Dio();
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    List<String> value = [image];

    try {
      var response = await dio.post(
          '${Links.baseUrl}api/property/$propertyType/update/$id',
          data: FormData.fromMap({
            'paths[]': [image],
          }),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      print('${Links.baseUrl}api/property/$propertyType/update/$id');

      if (response.data['Status'] == 'Success') {
        if (response.data['Message'] is String) {
          return right(response.data['Message']);
        }
      } else {
        if (response.data['Message'] is String) {
          return left(response.data['Message']);
        }
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
    return left('Something went wrong, please try again later');
  }

  @override
  Future<Either<String, String>> uploadImage(
      {required int id,
      required File image,
      required String propertyType}) async {
    Dio dio = Dio();
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    String imageUrl;
    print('uploading');

    String url = '';
    if (propertyType == 'house') {
      url = 'uploadHouseImage';
    } else if (propertyType == 'farm') {
      url = 'uploadFarmImage';
    } else {
      url = 'uploadShopImage';
    }
    print('${Links.baseUrl}api/property/$propertyType/$url');
    try {
      FormData formData = FormData();
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(
          image.path,
          filename: 'image.jpg',
        ),
      ));
      var upluadImageResponse =
          await dio.post('${Links.baseUrl}api/property/$propertyType/$url',
              data: formData,
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      print(upluadImageResponse.data);

      if (upluadImageResponse.data['Status'] == 'Success') {
        imageUrl = upluadImageResponse.data['Link'];
      } else {
        return left('upload image faild');
      }
    } on Exception catch (e) {
      print(e);
      return left('upload image faild');
    }
    if (imageUrl != null) {
      try {
        var response = await dio.post(
            '${Links.baseUrl}api/property/$propertyType/update/$id',
            data: FormData.fromMap({
              'images[]': [imageUrl]
            }),
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            }));
        print("'images[]': [${image.path}]");
        print(response.data);
        print('${Links.baseUrl}api/property/$propertyType/update/$id');

        if (response.data['Status'] == 'Success') {
          if (response.data['Message'] is String) {
            return right(response.data['Message']);
          }
        } else {
          if (response.data['Message'] is String) {
            return left(response.data['Message']);
          }
        }
      } on Exception catch (e) {
        return left('Something went wrong, please try again later');
      }
    } else {
      return left('Something went wrong, please try again later');
    }
    return left('Something went wrong, please try again later');
  }
}

int? checkBoolValue(String value, int? intValue) {
  if (value == 'true') {
    intValue = 1;
  } else if (value == 'false') {
    intValue = 0;
  }
  return intValue;
}

String checkKey(String key) {
  if (key == 'cladding') {
    key = 'has_cladding';
  } else if (key == 'rooms') {
    key = 'room_number';
  } else if (key == 'bathrooms') {
    key = 'bathroom_number';
  } else if (key == 'floor') {
    key = 'floor_number';
  } else if (key == 'green tabo') {
    key = 'green_tabo';
  } else if (key == 'water well') {
    key = 'has_water_well';
  } else if (key == 'parking') {
    key = 'has_parking';
  } else if (key == 'Stadium') {
    key = 'has_stadium';
  } else if (key == 'pool depth') {
    key = 'pool_depth';
  } else if (key == 'pool space') {
    key = 'pool_space';
  }
  return key;
}
