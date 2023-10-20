part of 'add_contract_bloc.dart';

abstract class AddContractState extends Equatable {
  const AddContractState();

  @override
  List<Object> get props => [];
}

class AddContractInitial extends AddContractState {}

class AddContractInitialFailure extends AddContractState {}

class AddContractInitialSuccess extends AddContractState {}

class AddContractInitialLoading extends AddContractState {}

// class AddContractLoading extends AddContractState {}

// class AddContractSuccess extends AddContractState {}

// class AddContractFailure extends AddContractState {}
