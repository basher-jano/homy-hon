// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/core/utils/user.dart';

import '../../../data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  var firstname;
  var lastname;
  var phone;
  var password;
  var email;
  bool register_status = false;

  String? registerMsg;

  Future<void> register() async {
    User user = User(
      first_name: firstname,
      last_name: lastname,
      phone: phone,
      password: password,
      email: email,
    );

    emit(RegisterLoading());
    var result = await registerRepo.register(user);
    result.fold(
      (failure) {
        registerMsg = failure.message?.email?.first ??
            failure.message?.phoneNumber?.first ??
            "Server error";
        emit(RegisterFailure());
      },
      (Response) {
        registerMsg = Response.message;
        emit(RegisterSuccess());
      },
    );
  }
}
