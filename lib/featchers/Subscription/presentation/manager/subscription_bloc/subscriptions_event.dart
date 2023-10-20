part of 'subscriptions_bloc.dart';

abstract class SubscriptionsEvent extends Equatable {
  const SubscriptionsEvent();

  @override
  List<Object> get props => [];
}

class SubscriptionsInitialEvent extends SubscriptionsEvent {}

class AddSubscriptionEvent extends SubscriptionsEvent {
  final int subscriptonId;

  const AddSubscriptionEvent(this.subscriptonId);
}
