part of 'newest_advertisment_cubit.dart';

abstract class NewestAdvertismentState {
  const NewestAdvertismentState();

  @override
  List<Object> get props => [];
}

class NewestAdvertismentInitial extends NewestAdvertismentState {}

class NewestAdvertismentLoading extends NewestAdvertismentState {}

class NewestAdvertismentSuccess extends NewestAdvertismentState {}

class NewestAdvertismentFailure extends NewestAdvertismentState {}
