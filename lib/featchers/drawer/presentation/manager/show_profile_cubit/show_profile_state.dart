part of 'show_profile_cubit.dart';

class ShowProfileState extends Equatable {
  const ShowProfileState();

  @override
  List<Object> get props => [];
}

class ShowProfileInitial extends ShowProfileState {}

class ShowProfileLoading extends ShowProfileState {}

class ShowProfileFailure extends ShowProfileState {
  final String errMessage;

  ShowProfileFailure(this.errMessage);
}

class ShowProfileSuccess extends ShowProfileState {
  final ProfileModel profileModel;

  ShowProfileSuccess(this.profileModel);
}
