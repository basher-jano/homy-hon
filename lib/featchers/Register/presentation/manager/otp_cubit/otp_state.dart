part of 'otp_cubit.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpFailure extends OtpState {
  final String errMessage;

  OtpFailure(this.errMessage);
}

class OtpSuccess extends OtpState {}
