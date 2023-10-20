import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/property_details/data/repos/property_details_repo/property_details_repo.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyDetailsRepoImple implements PropertyDetailsRepo {

  @override
  Future<Either<String, Property>> getPropertyDetails(int id) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response =
          await dio.get('${Links.baseUrl}api/property/show_details/$id',
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      print(response.data['Message']);
      print(response.data);
      try {
        Property result = Property.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, String>> addToWishList(int id) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/wish_list/add/$id',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      if (response.data['Code'] == 200) {
        return right(response.data['Message']);
      } else {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, Properties>> getWishList() async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/wish_list/show_all',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print('wishlist');
      print(response.data);
      try {
        if (response.data['List'] != null) {
          Properties result = Properties.fromJson(response.data);
          return right(result);
        } else {
          Properties result = Properties(
            status: response.data['Status'],
            message: response.data['Message'],
            list: [],
            code: response.data['Code'],
            pagination: null,
          );

          return right(result);
        }
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
