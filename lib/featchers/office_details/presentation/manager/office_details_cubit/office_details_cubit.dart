import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/office_details/data/repo/office_details_repo.dart';

import '../../../data/model/offices_details_model.dart';

part 'office_details_state.dart';

class OfficeDetailsCubit extends Cubit<OfficeDetailsState> {
  OfficeDetailsCubit(this.officeDetailsRepo) : super(OfficeDetailsInitial());
  final OfficeDetailsRepo officeDetailsRepo;
  var result;
  Future<void> fetchOfficeDetails(int? id) async {
    emit(OfficeDetailsLoading());
    result = (await officeDetailsRepo.fetchOfficeDetails(id));
    result.fold(
      (failure) {
        emit(OfficeDetailsFailure());
      },
      (data) {
        emit(OfficeDetailsSuccess(data));
      },
    );
  }
}
