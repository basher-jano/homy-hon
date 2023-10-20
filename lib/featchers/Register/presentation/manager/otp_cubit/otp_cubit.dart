import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/Register/data/repos/register_repo_impl.dart';

import '../../../data/repos/register_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(
    this.registerRepo,
  ) : super(OtpInitial());
  final RegisterRepo registerRepo;

  var email;
  var otp;
  var msg;

  Future<void> sendOtp(email) async {
    emit(OtpLoading());
    var result = await registerRepo.sendOtp(email);

    result.fold(
      (failure) {
        emit(OtpFailure(failure.errMessage));
      },
      (res) {
        otp = res.code;
        msg = res.message;

        emit(OtpSuccess());
      },
    );
  }
}
