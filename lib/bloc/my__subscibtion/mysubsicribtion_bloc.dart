import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/Subscription/data/repos/subscriptions_repo.dart';
import 'package:homy_hon/featchers/my_subsicribe/models/get_my_history_sub.dart';
import 'package:homy_hon/featchers/my_subsicribe/repos/my_sub_repo.dart';

part 'mysubsicribtion_event.dart';
part 'mysubsicribtion_state.dart';

class MysubsicribtionBloc
    extends Bloc<MysubsicribtionEvent, MysubsicribtionState> {
  List<MyHistorySub> myHistoryList = [];
  MysubsicribtionBloc() : super(MysubsicribtionInitial()) {
    on<MysubsicribtionEvent>((event, emit) async {
      if (event is HistorySub) {
        emit(Loading());
        (await MySubRepo.getMyHistorySub()).fold((l) => emit(Failure()), (r) {
          myHistoryList = r;

          emit(Success());
        });
      }
    });
  }
}
