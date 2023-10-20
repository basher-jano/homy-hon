part of 'login_cubit.dart';

abstract class LogintState extends Equatable {
  const LogintState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LogintState {}

class LoginLoading extends LogintState {}

class LoginFailure extends LogintState {
  final String errMessage;

  const LoginFailure(this.errMessage);
}

class LoginSuccess extends LogintState {}
