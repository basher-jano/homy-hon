import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/contracts/data/models/contracts_mode.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContractsRepoImpl implements ContractsRepo {

  @override
  Future<Either<String, Contracts>> getAllContracts() async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/contract/show_all',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      try {
        Contracts result = Contracts.fromJson(response.data);
        return right(result);
      } catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later.');
    }
  }

  @override
  Future<Either<String, String>> addContract({
    required int id,
    required String name,
    required String phone,
    required String ratio,
  }) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.post('${Links.baseUrl}api/contract/add',
          data: FormData.fromMap({
            'property_id': id,
            'name_first_party': name,
            'phone_number_FP': phone,
            'ratio': ratio,
          }),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);

      if (response.data['Status'] == 'Success') {
        return right(response.data['Message']);
      } else {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, p;ease try again later');
    }
  }
}
