import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/edit_profile_repo.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.editProfileRepo) : super(EditProfileInitial());

  final EditProfileRepo editProfileRepo;
  Future<void> editProfile() async {
    emit(EditProfileLoading());
    var response = await editProfileRepo.editProfile();
    response.fold(
        (l) => emit(EditProfileFailure()),
         (r) => emit(EditProfileSuccess()));
  }
 
}
