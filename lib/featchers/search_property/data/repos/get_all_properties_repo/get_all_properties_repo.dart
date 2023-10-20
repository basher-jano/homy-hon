import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

abstract class GetAllPropertiesRepo {
  // Future<Either<String, Properties>> getAllProperties();
  Future<Either<String, Properties>> getAllProperties();
}
