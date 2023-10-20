import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

abstract class PropertyDetailsRepo {
  Future<Either<String, Property>> getPropertyDetails(int id);
  Future<Either<String, String>> addToWishList(int id);
  Future<Either<String, Properties>> getWishList();
}
