import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../../../my_properties/data/models/my_property_model.dart';
import '../model/offices_details_model.dart';

abstract class OfficeDetailsRepo {
  Future<Either<Failure, OfficeDetailsModel>> fetchOfficeDetails(int? id);
  Future<Either<Failure, MyProperties?>> fetchRelatedProperties(int? id);
}
