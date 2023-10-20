import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/search_property/data/models/filter_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

abstract class ApplyFilterRepo {
  Future<Either<String, Properties>> applyFilter(FilterModel filterModel);
}
