import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

import '../../../data/repos/my_properties_repo.dart';

part 'my_properties_state.dart';

class MyPropertiesCubit extends Cubit<MyPropertiesState> {
  MyPropertiesCubit(this.propertiesRepo) : super(MyPropertiesInitial());

  final MyPropertiesRepo propertiesRepo;
  var respose;
  Properties? typerespose;
  bool isLoading = false;
   MyProperties? myProperty;
  var type = "";

  Future<void> fetchMyProperties() async {
    emit(MyPropertiesLoading());
    respose = (await propertiesRepo.fetchMyProperties());
    respose.fold(
        (l) => emit(MyPropertiesFailure(l)), (r) {
          myProperty = r;
          emit(MyPropertiesSuccess(r));
        });
  }

  Future<void> fetchTypedProperties(type) async {
    emit(TypedPropertiesLoading());
    typerespose = await propertiesRepo.fetchTypedProperties(type);
    emit(TypedPropertiesSuccess());
  }

  Future<void> delteproperty(String type, int id) async {
    isLoading = true;
    emit(DeletePropertyLoading());
    if (type == "House") {
      (await propertiesRepo.deleteHouse(id)).fold((l) {
        emit(DeletePropertyFailure());
      }, (r) {
        isLoading = false;

        if (respose!.list.any((element) => element.id == id)) {
          respose!.list.removeWhere((element) => element.id == id);
        }
        emit(DeletePropertySuccess());
      });
    }
    if (type == "Farm") {
      (await propertiesRepo.deleteFarm(id)).fold((l) {
        emit(DeletePropertyFailure());
      }, (r) {
        isLoading = false;

        if (respose!.list.any((element) => element.id == id)) {
          respose!.list.removeWhere((element) => element.id == id);
        }
        emit(DeletePropertySuccess());
      });
    }
    if (type == "Shop") {}
    (await propertiesRepo.deleteHouse(id)).fold((l) {
      emit(DeletePropertyFailure());
    }, (r) {
      isLoading = false;

      if (respose!.list.any((element) => element.id == id)) {
        respose!.list.removeWhere((element) => element.id == id);
      }
      emit(DeletePropertySuccess());
    });
  }
}
