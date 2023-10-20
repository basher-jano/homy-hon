import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/wish_list/data/repos/wish_list_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListRepoImpl implements WishListRepo {
  
  
  @override
  Future<Either<String, Properties>> getWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    Dio dio = Dio();
    try {
      var response = await dio.get('${Links.baseUrl}api/wish_list/show_all',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      try {
        if (response.data['List'] == null) {
          return left(response.data['Message']);
        } else {
          Properties result = Properties.fromJson(response.data);
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
