part of 'contracts_bloc_bloc.dart';

abstract class ContractsBlocEvent extends Equatable {
  const ContractsBlocEvent();

  @override
  List<Object> get props => [];
}

class GetContractsEvent extends ContractsBlocEvent {}
