import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/governorates_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/regions_model.dart';

abstract class GetGovernoratesRepo {
  Future<Either<String, Governorates>> getGovernorates();
  Future<Either<String, Regions>> getRegions(int id);
}
