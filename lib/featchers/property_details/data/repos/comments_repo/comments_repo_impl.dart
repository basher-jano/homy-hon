import 'package:dio/dio.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/property_details/data/models/add_comment_model.dart';
import 'package:homy_hon/featchers/property_details/data/models/comments_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/property_details/data/repos/comments_repo/comments_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentsRepoImpl extends CommentsRepo {
 
  @override
  Future<Either<String, AddComment>> addComment(int id, String content) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.post('${Links.baseUrl}api/comment/add/$id',
          data: FormData.fromMap({"description": content}),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      try {
        var result = AddComment.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, Comments>> getComments(int id) async {
    Dio dio = Dio();
   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/comment/show_all/$id',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      try {
        Comments result = Comments.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, String>> deleteComment(int id) async {
    Dio dio = Dio();
       SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.post('${Links.baseUrl}api/comment/delete/$id',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      if (response.data['Code'] == 200) {
        return right(response.data['Message']);
      } else {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
