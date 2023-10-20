import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_profil_office_state.dart';

class EditProfilOfficeCubit extends Cubit<EditProfilOfficeState> {

  EditProfilOfficeCubit(this.editProfileRepo) : super(EditProfilOfficeInitial());

  final editProfileRepo;

    Future<void> editProfileoffice() async {
    emit(EditProfileOfficeLoading());
    var response = await editProfileRepo.editProfileoffice();
    response.fold(
        (l) => emit(EditProfileOfficeFailure()),
         (r) => emit(EditProfileOfficeSuccess()));
  }
}
