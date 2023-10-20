import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_all_properties_repo/get_all_properties_repo.dart';

import '../../../../search_property/data/models/properties_model.dart';
import '../../../data/repos/all_properties_repo.dart';

part 'all_properties_state.dart';

class AllPropertiesCubit extends Cubit<AllPropertiesState> {
  AllPropertiesCubit(this.allPropertiesRepo) : super(AllPropertiesInitial());

  Properties? response;

  final AllPropertiesRepo allPropertiesRepo;

  Future<void> fetchallProperties() async {
    emit(AllPropertiesLoading());
    response = await allPropertiesRepo.fetchallProperties();
    emit(AllPropertiesSuccess());
  }
}
