import 'package:dartz/dartz.dart';
import 'package:homy_hon/core/failures.dart';
import 'package:homy_hon/featchers/advertisements/data/models/Advertisements_model/advertisements_model.dart';

abstract class AdvertisementsRepo {
  Future<List> fetchAdvertisements();
}
