import 'package:dartz/dartz.dart';

import '../../../search_property/data/models/properties_model.dart';
import '../models/my_property_model.dart';

abstract class MyPropertiesRepo {
  Future<Either<String,MyProperties?>> fetchMyProperties();
  Future<Properties?> fetchTypedProperties(type);
 Future<Either<String, dynamic>>deleteHouse(int id);
  Future<Either<String, dynamic>>deleteFarm(int id);
 Future<Either<String, dynamic>>deleteShop(int id);

 
}
