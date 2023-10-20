import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/offices/data/repo/offices_repo.dart';
part 'offices_state.dart';

class OfficesCubit extends Cubit<OfficesState> {
  OfficesCubit(this.officesRepo) : super(OfficesInitial());
  final OfficesRepo officesRepo;
  var officesModel;
  var msg;
  Future<void> fetchOffices() async {
    emit(OfficesLoading());
    officesModel = await officesRepo.fetchOffices();
    officesModel.fold(
        (l) => emit(OfficesFailure(l)), (r) => emit(OfficesSuccess(r)));
  }
}
