import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../search_property/data/models/properties_model.dart';
import '../models/my_property_model.dart';
import 'my_properties_repo.dart';

class MyPropertiesRepoImpl implements MyPropertiesRepo {
  Dio dio = Dio();
  

  @override
  Future<Either<String,MyProperties?>> fetchMyProperties() async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var respone = await dio.get(Links.baseUrl + "api/property/show_all_mine",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
      if (respone.data["Status"] == 'blocked') {
        return left(respone.data['Message']);
      }  else{
 var result = MyProperties.fromJson(respone.data);

    return Right(result);
      }
   
    
  }

  @override
  Future<Properties?> fetchTypedProperties(type) async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var respone =
          await dio.post(Links.baseUrl + "api/property/show_searchSorting",
              data: {"$type": "$type"},
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));

      print(respone.statusCode);
      print(respone.data);

      var result = Properties.fromJson(respone.data);

      return result;
    } on Exception catch (e) {
      print("catchhhh");
      print(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> deleteFarm(int id) {
    return BaseApiClient.delete(
      url: Links.baseUrl + Links.startPoint + "house/delete/" + id.toString(),
      converter: (value) {
        return value[""];
      },
    );
  }

  @override
  Future<Either<String, dynamic>> deleteHouse(int id) {
    return BaseApiClient.delete(
      url: Links.baseUrl + Links.startPoint + "house/delete/" + id.toString(),
      converter: (value) {
        return value[""];
      },
    );
  }

  @override
  Future<Either<String, dynamic>> deleteShop(int id) {
    return BaseApiClient.delete(
      url: Links.baseUrl + Links.startPoint + "house/delete/" + id.toString(),
      converter: (value) {
        return value[""];
      },
    );
  }
}
