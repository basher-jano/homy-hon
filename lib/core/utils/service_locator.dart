import 'package:get_it/get_it.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo_impl.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<GetGovernoratesRepoImpl>(GetGovernoratesRepoImpl());
  getIt.registerFactory<AddpropertyBloc>(() => AddpropertyBloc(getIt()));
}
