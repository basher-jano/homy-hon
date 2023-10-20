part of 'add_contract_bloc.dart';

abstract class AddContractEvent extends Equatable {
  const AddContractEvent();

  @override
  List<Object> get props => [];
}

class AddContractInitialEvent extends AddContractEvent {}

class AddNewContractEvent extends AddContractEvent {
  final int propertyId;
  final String nameFirstParty;
  final String phoneNumber;
  final String ratio;

  const AddNewContractEvent({
    required this.propertyId,
    required this.nameFirstParty,
    required this.phoneNumber,
    required this.ratio,
  });
}
