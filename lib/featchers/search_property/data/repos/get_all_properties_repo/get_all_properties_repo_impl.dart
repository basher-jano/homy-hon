import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_all_properties_repo/get_all_properties_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllPropertiesReopImpl implements GetAllPropertiesRepo {
  
  @override
  Future<Either<String, Properties>> getAllProperties() async {
    Dio dio = Dio();
SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get("${Links.baseUrl}api/property/show_all",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);

      try {
        var result = Properties.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again leter.');
    }
  }
}
