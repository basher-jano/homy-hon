import 'package:dartz/dartz.dart';

import '../model/offices_model/offices_model.dart';

abstract class OfficesRepo {
  Future<Either<String,OfficesModel?>> fetchOffices();
}
