import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/search_property/data/models/governorates_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/regions_model.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetGovernoratesRepoImpl implements GetGovernoratesRepo {

  @override
  Future<Either<String, Governorates>> getGovernorates() async {
    Dio dio = Dio();
SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/show_governorates',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      try {
        Governorates result = Governorates.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, Regions>> getRegions(int id) async {
    Dio dio = Dio();
SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/show_regions/$id',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);

      try {
        Regions result = Regions.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
