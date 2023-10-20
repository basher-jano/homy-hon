import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/failures.dart';
import '../../../../data/remote_date/api_handler/links.dart';
import '../../../../main.dart';
import '../model/offices_details_model.dart';
import 'office_details_repo.dart';

class OfficeDetailsRepoImpl implements OfficeDetailsRepo {

  Dio dio = Dio();

  @override
  Future<Either<Failure, OfficeDetailsModel>> fetchOfficeDetails(
      int? account_id) async {
           SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var url =
        Links.baseUrl + 'api/accounts/showOfficeDetails/' + "${account_id}";

    var response = await dio.get(url,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.data['Status'] == 'Success' && response.statusCode == 200) {
      var result = OfficeDetailsModel.fromJson(response.data);
      return right(result);
    } else {
      return left(ServerFailure(response.data['Message']));
    }
  }

  @override
  Future<Either<Failure, MyProperties?>> fetchRelatedProperties(int? id) async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    var response = await dio.get(
        Links.baseUrl + "api/property/propertiesOffice/" + "${id}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }));

    if (response.data['Status'] == 'Success' && response.statusCode == 200) {
      var result = MyProperties.fromJson(response.data);

      return Right(result);
    } else if (response.data['Status'] == 'Failed' &&
        response.statusCode == 200) {
      return left(ServerFailure(response.data['Message']));
    } else {
      return left(ServerFailure(response.data['Message']));
    }
  }
}
