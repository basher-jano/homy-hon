part of 'contracts_bloc_bloc.dart';

abstract class ContractsState extends Equatable {
  const ContractsState();

  @override
  List<Object> get props => [];
}

class ContractsBlocInitial extends ContractsState {}

class ContractsBlocLoading extends ContractsState {}

class ContractsBlocSuccess extends ContractsState {}

class ContractsBlocFailure extends ContractsState {
  final String errMsg;

  ContractsBlocFailure(this.errMsg);
}
