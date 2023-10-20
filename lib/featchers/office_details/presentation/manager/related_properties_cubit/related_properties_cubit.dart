import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../my_properties/data/models/my_property_model.dart';
import '../../../data/repo/office_details_repo.dart';

part 'related_properties_state.dart';

class RelatedPropertiesCubit extends Cubit<RelatedPropertiesState> {
  RelatedPropertiesCubit(this.officeDetailsRepo)
      : super(RelatedPropertiesInitial());

  final OfficeDetailsRepo officeDetailsRepo;
  var response;
  Future<void> fetchRelatedProperties(int? id) async {
    emit(RelatedPropertiesLoading());
    response = await officeDetailsRepo.fetchRelatedProperties(id);
    response.fold(
        (failure) => emit(RelatedPropertiesIFailure(failure.errMessage)),
        (result) => emit(RelatedPropertiesSuccess(result)));
  }
}
