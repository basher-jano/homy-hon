import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/offices/data/model/offices_model/offices_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/filter_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/offices_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_all_properties_repo/get_all_properties_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_all_properties_repo/get_all_properties_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_offices_repo/get_offices_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_offices_repo/get_offices_repo_impl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  int officesOrProperies = 0;

  Properties? properties;
  OfficesModel? offices;

  SearchBloc(GetAllPropertiesReopImpl getAllPropertiesReopImpl,
      GetOfficesRepoImpl getOfficesRepoImpl)
      : super(SearchInitial()) {
    GetAllPropertiesRepo getAllPropertiesRepo = getAllPropertiesReopImpl;
    GetOfficesRepo getOfficesRepo = getOfficesRepoImpl;
    on<SearchEvent>((event, emit) async {
      if (event is GetAllPropertiesEvent) {
        properties = null;
        emit(LoadingState());

        var propertiesResult = await getAllPropertiesRepo.getAllProperties();

        propertiesResult.fold(
          (l) {
            emit(FailureState(l));
            properties = null;
          },
          (r) {
            emit(SuccessState());
            properties = r;
          },
        );
      }

      if (event is GetAllOfficesEvent) {
        emit(LoadingState());

        var officesResult = await getOfficesRepo.getOffices();

        officesResult.fold(
          (l) {
            emit(FailureState(l));
            offices = null;
          },
          (r) {
            emit(SuccessState());
            offices = r;
          },
        );
      }

      if (event is SearchForOfficeEvent) {
        offices = null;
        emit(LoadingState());
        var result = await getOfficesRepo.searchOffice(event.officeName);
        result.fold(
          (l) {
            offices = null;
            emit(FailureState(l));
          },
          (r) {
            offices = r;
            emit(SuccessState());
          },
        );
      }
    });
  }
}
