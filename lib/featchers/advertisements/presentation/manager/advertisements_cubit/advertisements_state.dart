part of 'advertisements_cubit.dart';

class AdvertisementsState extends Equatable {
  const AdvertisementsState();

  @override
  List<Object> get props => [];
}

class AdvertisementsInitial extends AdvertisementsState {}

class AdvertisementsLoading extends AdvertisementsState {}

class AdvertisementsFailure extends AdvertisementsState {}

class AdvertisementsSuccess extends AdvertisementsState {}
