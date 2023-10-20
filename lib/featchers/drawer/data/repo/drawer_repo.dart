import 'package:dartz/dartz.dart';

import '../../../../core/failures.dart';
import '../models/profile_model/profile_model.dart';

abstract class DrawerRepo {
  Future<Either<Failure, ProfileModel>> showProfile();
}
