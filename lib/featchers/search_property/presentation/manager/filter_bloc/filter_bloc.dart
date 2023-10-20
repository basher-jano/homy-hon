import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/search_property/data/models/filter_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/governorates_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/regions_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/regions_model.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo_impl.dart';

import '../../../data/models/regions_model.dart';
import '../../../data/models/regions_model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  Governorates? governorates;
  Regions? regions;
  int? choosenGovernorate;
  double? latitude;
  double? langtude;
  FilterBloc(
    ApplyFilterRepoImpl applyFilterRepoImpl,
    GetGovernoratesRepoImpl getGovernoratesRepoImpl,
  ) : super(FilterInitial()) {
    final ApplyFilterRepo applyFilterRepo = applyFilterRepoImpl;
    final GetGovernoratesRepo getGovernoratesRepo = getGovernoratesRepoImpl;
    on<FilterEvent>((event, emit) async {
      if (event is ApplyFilterEvent) {
        emit(FilterLoading());
        if (langtude != null) {
          event.filterModel.langtude = langtude;
        }
        if (latitude != null) {
          event.filterModel.latitude = latitude;
        }
        event.filterModel.createFilter();
        var result = await applyFilterRepo.applyFilter(event.filterModel);
        result.fold(
            (l) => emit(FilterFailure(l)), (r) => emit(FilterSuccess(r)));
      }
      if (event is FilterInitialEvent) {
        var result = await getGovernoratesRepo.getGovernorates();
        result.fold(
          (l) => emit(GovernoratesFailure(l)),
          (r) {
            governorates = r;
            emit(GovernoratesSuccess(r));
          },
        );
      }
      if (event is ChooseGovernorates) {
        var result = await getGovernoratesRepo.getRegions(event.id);
        result.fold(
          (l) => emit(RegionsFailure(l)),
          (r) {
            emit(const RegionsFailure("errMsg"));
            emit(RegionsSuccess(r));
          },
        );
      }
    });
  }
}
