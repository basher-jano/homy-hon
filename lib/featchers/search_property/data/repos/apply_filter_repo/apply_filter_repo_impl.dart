import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/search_property/data/models/filter_model.dart';

import 'package:homy_hon/core/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'apply_filter_repo.dart';

class ApplyFilterRepoImpl implements ApplyFilterRepo {
  
  @override
  Future<Either<String, Properties>> applyFilter(
      FilterModel filterModel) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    Dio dio = Dio();
    print(filterModel.getFilter());
    try {
      var response = await dio.post(
        "${Links.baseUrl}api/property/show_searchSorting",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: FormData.fromMap(filterModel.getFilter()),
      );
      print(response.data);
      try {
        Properties result = Properties.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
