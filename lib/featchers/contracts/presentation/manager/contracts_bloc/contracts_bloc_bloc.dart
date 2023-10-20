import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/contracts/data/models/contracts_mode.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo_impl.dart';

part 'contracts_bloc_event.dart';
part 'contracts_bloc_state.dart';

class ContractsBloc extends Bloc<ContractsBlocEvent, ContractsState> {
  Contracts? contracts;
  ContractsBloc(ContractsRepoImpl contractsRepoImpl)
      : super(ContractsBlocInitial()) {
    ContractsRepo contractsRepo = contractsRepoImpl;
    on<ContractsBlocEvent>((event, emit) async {
      if (event is GetContractsEvent) {
        emit(ContractsBlocLoading());
        var result = await contractsRepo.getAllContracts();

        result.fold(
          (l) => emit(ContractsBlocFailure(l)),
          (r) {
            contracts = r;
            emit(ContractsBlocSuccess());
          },
        );
      }
    });
  }
}
