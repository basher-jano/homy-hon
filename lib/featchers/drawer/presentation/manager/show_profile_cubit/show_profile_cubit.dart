import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/profile_model/profile_model.dart';
import '../../../data/repo/drawer_repo.dart';

part 'show_profile_state.dart';

class ShowProfileCubit extends Cubit<ShowProfileState> {
  ShowProfileCubit(this.drawerRepo) : super(ShowProfileInitial());

  final DrawerRepo drawerRepo;
  var response;
  Future<void> showProfile() async {
    emit(ShowProfileLoading());
    response = await drawerRepo.showProfile();
    response.fold((failure) => emit(ShowProfileFailure(failure.errMessage)),
        (result) => emit(ShowProfileSuccess(result)));
  }
}
