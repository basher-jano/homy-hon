import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/property_details/data/models/add_comment_model.dart';
import 'package:homy_hon/featchers/property_details/data/models/comments_model.dart';

abstract class CommentsRepo {
  Future<Either<String, Comments>> getComments(int id);
  Future<Either<String, AddComment>> addComment(int id, String content);
  Future<Either<String, String>> deleteComment(int id);
}
