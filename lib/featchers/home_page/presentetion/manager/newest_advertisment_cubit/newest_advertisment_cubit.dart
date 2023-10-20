import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/home_page/data/repos/home_page_repo.dart';
import 'package:homy_hon/featchers/home_page/data/repos/home_page_repo_impl.dart';

import '../../../../property_details/data/models/comments_model.dart';

part 'newest_advertisment_state.dart';

class NewestAdvertismentCubit extends Cubit<NewestAdvertismentState> {
  NewestAdvertismentCubit(this.homePageRepo)
      : super(NewestAdvertismentInitial());

  final HomePageRepoImpl homePageRepo;

  List<dynamic> response = [];

  Future<void> fetchNewestAds() async {
    emit(NewestAdvertismentLoading());
    response = await homePageRepo.fetchNewestAds();
    emit(NewestAdvertismentSuccess());
  }
}
