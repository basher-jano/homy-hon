import 'package:dartz/dartz.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:homy_hon/featchers/Register/data/models/send_otp_modle.dart';

import '../../../../core/failures.dart';
import '../models/error_register_model/error_register_model.dart';
import '../models/register_model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<ErrorRegisterModel, RegisterModel>> register(User user);
  Future<Either<Failure, SendOtpModle>> sendOtp(email);
}
