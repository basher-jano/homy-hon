import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/my_properties/data/models/my_property_model.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';

import '../../../data/repos/home_page_repo.dart';

part 'newest_property_state.dart';

class NewestPropertyCubit extends Cubit<NewestPropertyState> {
  NewestPropertyCubit(this.homePageRepo) : super(NewestPropertyInitial());
  MyProperties? response;
  final HomePageRepo homePageRepo;
  Future<void> fetchNewestProperty() async {
    emit(NewestPropertyLoading());
    response = await homePageRepo.fetchNewestProperty();
    emit(NewestPropertySuccess());
  }
}
