import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/edit_profile/data/model/edit_profile_user_error/edit_profile_user_error_model.dart';

import '../model/edit_profile_model/edit_profile_model.dart';

abstract class EditProfileRepo {
  Future<Either<EditProfileUserErrorModel,EditProfileModel>> editProfile();
  Future<Either<EditProfileUserErrorModel,EditProfileModel>> editProfileoffice();
}
