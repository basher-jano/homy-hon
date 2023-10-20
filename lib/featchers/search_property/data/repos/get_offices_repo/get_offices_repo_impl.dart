import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/offices_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_offices_repo/get_offices_repo.dart';
import 'package:homy_hon/main.dart';

class GetOfficesRepoImpl implements GetOfficesRepo {
    var token = prefs!.getString('token');

  @override
  Future<Either<String, OfficesModel>> searchOffice(String name) async {
    Dio dio = Dio();
    var response = await dio.post('${Links.baseUrl}api/searchForOffice',
        data: FormData.fromMap({"officeName": name}),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer $token",
          },
        ));
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaa');

    print(name);
    print(response.data);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
    try {
      OfficesModel result = OfficesModel.fromJson(response.data);
      return right(result);
    } on Exception catch (e) {
      return left(response.data['Message']);
    }
  }

  @override
  Future<Either<String, OfficesModel>> getOffices() async {
    Dio dio = Dio();

    var response = await dio.post('${Links.baseUrl}api/searchForOffice',
        data: FormData.fromMap({"officeName": ""}),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer $token",
          },
        ));
    print(response.data);
    if(response.data["Status"]=='blocked'){
      return left(response.data['Message']);
    }

    try {
      OfficesModel result = OfficesModel.fromJson(response.data);
      return right(result);
    } on Exception catch (e) {
      return left(response.data['Message']);
    }
  }
}
