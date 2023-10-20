import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/home_page/data/repos/home_page_repo.dart';

import '../../../data/models/types.dart';

part 'types_state.dart';

class TypesCubit extends Cubit<TypesState> {
  TypesCubit(this.homePageRepo) : super(TypesInitial());

  final HomePageRepo homePageRepo;

  List<dynamic> typesList = [];

  Future<void> fetchPropertyTypes() async {
    emit(TypesLoading());
    typesList = await homePageRepo.fetchPropertyTypes();
    emit(TypesSuccess());
  }
}
