import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/core/failures.dart';
import '../../../data/models/Advertisements_model/advertisements_model.dart';
import '../../../data/repo/advertisements_repo.dart';
part 'advertisements_state.dart';

class AdvertisementsCubit extends Cubit<AdvertisementsState> {
  AdvertisementsCubit(this.advertisementsRepo) : super(AdvertisementsInitial());

  final AdvertisementsRepo advertisementsRepo;
  List<dynamic> response = [];
  Future<void> fetchAdvertisements() async {
    print("fetchAdvertisements/cubit");
    emit(AdvertisementsLoading());
    response = await advertisementsRepo.fetchAdvertisements();
    emit(AdvertisementsSuccess());
  }
}
