import 'package:dartz/dartz.dart';
import 'package:homy_hon/core/failures.dart';
import 'package:homy_hon/core/utils/user.dart';

import '../models/login_model/login_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login(User user);
  Future<void> logout();
}
