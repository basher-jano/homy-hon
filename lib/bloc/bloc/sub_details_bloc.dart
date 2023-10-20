import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/my_subsicribe/models/get_my_sub_response.dart';
import 'package:homy_hon/featchers/my_subsicribe/repos/my_sub_repo.dart';

part 'sub_details_event.dart';
part 'sub_details_state.dart';

class SubDetailsBloc extends Bloc<SubDetailsEvent, SubDetailsState> {
  GetMySubResponse? getMySubResponse =
      GetMySubResponse(date: "", remainingProperty: 2);
  SubDetailsBloc() : super(SubDetailsInitial()) {
    on<SubDetailsEvent>((event, emit) async {
      if (event is getSubDetials) {
        emit(Loading());
        (await MySubRepo.getMySub()).fold((l) => emit(Failure()), (r) {
          print(r.date);
          print(r.remainingProperty);
          getMySubResponse!.date = r.date;

          getMySubResponse!.remainingProperty = r.remainingProperty;
          emit(Success());
        });
      }
    });
  }
}
