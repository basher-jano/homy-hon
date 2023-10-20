import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

abstract class WishListRepo {
  Future<Either<String, Properties>> getWishList();
}
