import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

import '../models/types.dart';

abstract class HomePageRepo {
  Future<MyProperties?> fetchNewestProperty();
  Future<List<dynamic>> fetchPropertyTypes();
  Future<List<dynamic>> fetchNewestAds();
}
