import 'package:dio/dio.dart';
import 'package:homy_hon/featchers/advertisements/data/models/Advertisements_model/advertisements_model.dart';

import 'package:homy_hon/core/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants.dart';
import '../../../../data/remote_date/api_handler/links.dart';
import '../../../../main.dart';
import 'advertisements_repo.dart';

class AdvertisementsRepoImpl implements AdvertisementsRepo {
  Dio dio = Dio();

  // var token = myBox!.get(kToken);

  @override
  Future<List> fetchAdvertisements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    print("fetchAdvertisements/impl");
    var response = await dio.get(Links.baseUrl + 'api/ads/index',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.statusCode == 200 && response.data['Status'] == 'Success') {
      var result = AdvertisementsModel.fromJson(response.data);
      print(response.statusCode);
      print(response.data);
      return result.list;
    } else {
      return [];
    }
  }
}
