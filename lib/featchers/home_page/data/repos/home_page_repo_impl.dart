import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/remote_date/api_handler/links.dart';
import '../../../../main.dart';
import '../../../advertisements/data/models/Advertisements_model/advertisements_model.dart';
import '../../../my_properties/data/models/my_property_model.dart';
import '../models/types.dart';
import 'home_page_repo.dart';

class HomePageRepoImpl implements HomePageRepo {
  @override
  Dio dio = Dio();
  // var token = myBox!.get(kToken);
 

  Future<MyProperties?> fetchNewestProperty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
     print("===homeTOKEN===");
      print(token);
     print("===homeTOKEN===");

    var respone = await dio.get(Links.baseUrl + "api/property/orderDesc",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    var result = MyProperties.fromJson(respone.data);

    return result;
  }

  @override
  Future<List<dynamic>> fetchPropertyTypes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get(Links.baseUrl + 'api/types',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      if (response.statusCode == 200) {
        var result = Types.fromJson(response.data);

        List<dynamic> tl;
        tl = result.list;
        return tl;
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Future<List> fetchNewestAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var respone = await dio.get(Links.baseUrl + "api/ads/orderDesc",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    var result = AdvertisementsModel.fromJson(respone.data);

    return result.list;
  }
}
