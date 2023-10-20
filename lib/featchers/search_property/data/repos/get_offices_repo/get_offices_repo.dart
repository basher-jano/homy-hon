import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/offices_model.dart';

abstract class GetOfficesRepo {
  Future<Either<String, OfficesModel>> getOffices();
  Future<Either<String, OfficesModel>> searchOffice(String name);
}
