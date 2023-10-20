import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/user.dart';
import '../../../data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LogintState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  var email;
  var password;
  String? loginMsg;
  Future<void> login() async {
    User user = User(
      password: password,
      email: email,
    );
    emit(LoginLoading());

    var result = await loginRepo.login(user);
    result.fold(
      (failure) {
        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-");
        print("LoginFailure(failure.errMessage)");
        loginMsg = failure.errMessage;
        print(loginMsg);
        print("+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
        emit(LoginFailure(failure.errMessage));
      },
      (Response) {
        print("=======================================");
        print("emit(LoginSuccess());");
        loginMsg = Response.message;
        print(loginMsg);
        print("========================================");
        emit(LoginSuccess());
      },
    );
  }

  Future<void> logout() async {
    var response = await loginRepo.logout();
  }
}
