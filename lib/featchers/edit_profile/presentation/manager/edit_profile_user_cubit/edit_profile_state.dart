part of 'edit_profile_cubit.dart';

class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileFailure extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}
