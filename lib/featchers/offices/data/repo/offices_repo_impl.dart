import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/offices/data/repo/offices_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/remote_date/api_handler/links.dart';

class OfficesRepoImpl implements OfficesRepo {
  Dio dio = Dio();

  @override
  Future<Either<String, OfficesModel?>> fetchOffices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var response = await dio.post(Links.baseUrl + 'api/searchForOffice',
          data: {"officeName": ""},
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      if (response.data["Status"] == 'blocked') {
        return left(response.data['Message']);
      }

      try {
        OfficesModel result = OfficesModel.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
       return left('somthing went wrong');
      print(e.toString());
    }
  }
}
