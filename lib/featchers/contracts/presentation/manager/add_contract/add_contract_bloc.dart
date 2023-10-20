import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo_impl.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/my_properties/data/repos/my_properties_repo.dart';
import 'package:homy_hon/featchers/my_properties/data/repos/my_properties_repo_impl.dart';

import '../../../../search_property/data/models/properties_model.dart';

part 'add_contract_event.dart';
part 'add_contract_state.dart';

class AddContractBloc extends Bloc<AddContractEvent, AddContractState> {
  MyProperties? myProperties;
  List<int> myPropertiesIds = [];

  bool addContractLoading = false;
  bool? addContractSuccess;
  String? addContractMessage;

  TextEditingController idController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ratioController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  AddContractBloc(MyPropertiesRepoImpl myPropertiesRepoImpl,
      ContractsRepoImpl contractsRepoImpl)
      : super(AddContractInitial()) {
    MyPropertiesRepo myPropertiesRepo = myPropertiesRepoImpl;
    ContractsRepo contractsRepo = contractsRepoImpl;

    on<AddContractEvent>((event, emit) async {
      if (event is AddContractInitialEvent) {
        emit(AddContractInitialLoading());
        var myPropertiesResult = await myPropertiesRepo.fetchMyProperties();
        myPropertiesResult.fold((l) {
          myProperties = null;
        }, (r) {
          return myProperties = r;
        },);
        if (myPropertiesResult != null) {
          // myProperties = myPropertiesResult;
          if (myProperties!.list.isNotEmpty) {
            for (var i = 0; i < myProperties!.list.length; i++) {
              myPropertiesIds.add(myProperties!.list[i].id);
            }
          }
          emit(AddContractInitialSuccess());
        } else {
          emit(AddContractInitialFailure());
        }
      }
      if (event is AddNewContractEvent) {
        addContractLoading = true;
        emit(AddContractInitial());
        emit(AddContractInitialSuccess());

        var result = await contractsRepo.addContract(
          id: event.propertyId,
          name: event.nameFirstParty,
          phone: event.phoneNumber,
          ratio: event.ratio,
        );
        result.fold(
          (l) {
            addContractLoading = false;
            addContractMessage = l;
            addContractSuccess = false;
            emit(AddContractInitial());
            emit(AddContractInitialSuccess());
          },
          (r) {
            addContractLoading = false;
            addContractMessage = r;
            addContractSuccess = true;
            idController.clear;
            nameController.clear;
            phoneController.clear;
            ratioController.clear;
            emit(AddContractInitial());
            emit(AddContractInitialSuccess());
          },
        );
      }
    });
  }
}
