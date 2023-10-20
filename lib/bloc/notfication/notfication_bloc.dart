import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/Login/data/models/notfication_model/all_notfication_response.dart';
import 'package:homy_hon/featchers/notfication/data/repos/notfication_repo.dart';

part 'notfication_event.dart';
part 'notfication_state.dart';

class NotficationBloc extends Bloc<NotficationEvent, NotficationState> {
  List<AllNotficationResponse> notficationList = [];
  NotficationBloc() : super(NotficationInitial()) {
    on<NotficationEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetNotficationEvent) {
        emit(Loading());
        (await NotficationRepo.getAllNotfication()).fold((l) => emit(Failure()),
            (r) {
          print("object");
          notficationList = r;
          emit(Success());
        });
      }

      if (event is UpdateNotficationState) {
        (await NotficationRepo.changeNotficationState(event.id))
            .fold((l) => emit(Failure()), (r) {
          notficationList[event.index].seen = "true";
          emit(SuccesChangeState());
        });
      }
    });
  }
}
