import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class EditPropertyRepo {
  Future<Either<String, String>> editPropertyInfo(
      int id, String key, String value, String propertyType);
  Future<Either<String, String>> deletePropertyImage(
      {required int id, required String image, required String propertyType});
  Future<Either<String, String>> uploadImage(
      {required int id, required File image, required String propertyType});
}
