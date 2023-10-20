import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/Subscription/data/models/subscriptions_model.dart';
import 'package:homy_hon/featchers/Subscription/data/repos/subscriptions_repo.dart';
import 'package:homy_hon/featchers/Subscription/data/repos/subscriptions_repo_impl.dart';

part 'subscriptions_event.dart';
part 'subscriptions_state.dart';

class SubscriptionsBloc extends Bloc<SubscriptionsEvent, SubscriptionsState> {
  bool addSubscrptionLoading = false;
  bool? addSubscrptionSuccess;
  String? addSubscriptonMessage;
  int? subscriptionId;

  Subscriptions? subscriptions;

  SubscriptionsBloc(SubscriptionsRepoImpl subscriptionsRepoImpl)
      : super(SubscriptionsInitial()) {
    SubscriptionsRepo subscriptionsRepo = subscriptionsRepoImpl;

    on<SubscriptionsEvent>((event, emit) async {
      if (event is SubscriptionsInitialEvent) {
        emit(SubscriptionsLoading());
        var result = await subscriptionsRepo.getAllSubscriptions();
        result.fold(
          (l) => emit(SubscriptionsFailure(l)),
          (r) {
            subscriptions = r;
            emit(SubscriptionsSuccess(r));
          },
        );
      }
      if (event is AddSubscriptionEvent) {
        addSubscrptionLoading = true;
        emit(SubscriptionsInitial());
        emit(SubscriptionsSuccess(subscriptions!));
        try {
          var result =
              await subscriptionsRepo.addSubscription(event.subscriptonId);
          result.fold(
            (l) {
              addSubscrptionSuccess = false;
              addSubscriptonMessage = l;
              addSubscrptionLoading = false;
              emit(SubscriptionsInitial());
              emit(SubscriptionsSuccess(subscriptions!));
            },
            (r) {
              addSubscrptionSuccess = true;
              addSubscriptonMessage = r;
              addSubscrptionLoading = false;
              emit(SubscriptionsInitial());
              emit(SubscriptionsSuccess(subscriptions!));
            },
          );
        } on Exception catch (e) {
          addSubscrptionSuccess = false;
          addSubscriptonMessage = 'Something went wrong';
          addSubscrptionLoading = false;
          emit(SubscriptionsInitial());
          emit(SubscriptionsSuccess(subscriptions!));
        }
      }
    });
  }
}
