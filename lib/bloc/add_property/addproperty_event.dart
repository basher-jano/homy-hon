// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addproperty_bloc.dart';

abstract class AddpropertyEvent extends Equatable {
  const AddpropertyEvent();

  @override
  List<Object> get props => [];
}

class IsRentEvent extends AddpropertyEvent {}

class NavigateEvent extends AddpropertyEvent {
  final ScreenNavigate screenNavigate;
  const NavigateEvent({required this.screenNavigate});
}

class GetGovernoratesEvent extends AddpropertyEvent {}

class GetRegionsEvent extends AddpropertyEvent {
  final int id;

  const GetRegionsEvent(this.id);
}

class GetRegionId extends AddpropertyEvent {
  int index;
  GetRegionId({
    required this.index,
  });
}

class UploadImageEvent extends AddpropertyEvent {
  File? image;
  UploadImageEvent({
    required this.image,
  });
}

class AddPropertysevent extends AddpropertyEvent {}

class IsValidateEvent extends AddpropertyEvent {}

class IsValidateHomeDetailsEvent extends AddpropertyEvent {}

class IsValidateShopDetailsEvent extends AddpropertyEvent {}

class IsValidateFarmDetailsEvent extends AddpropertyEvent {}

class IsValidateUploadShopEvent extends AddpropertyEvent {}

class IsValidateUploadFarmEvent extends AddpropertyEvent {}

class IsValidateUploadHouseEvent extends AddpropertyEvent {}
class deletePhotoFromServer extends AddpropertyEvent{}