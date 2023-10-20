import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../search_property/data/models/properties_model.dart';
import 'all_properties_repo.dart';

class AllPropertiesRepoImpl implements AllPropertiesRepo {

  @override
  Future<Properties?> fetchallProperties() async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var response = await dio.get(Links.baseUrl + "api/property/show_all",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));
    var result = Properties.fromJson(response.data);
    return result;
  }
}
