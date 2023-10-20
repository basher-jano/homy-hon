part of 'subscriptions_bloc.dart';

abstract class SubscriptionsState extends Equatable {
  const SubscriptionsState();

  @override
  List<Object> get props => [];
}

class SubscriptionsInitial extends SubscriptionsState {}

class SubscriptionsSuccess extends SubscriptionsState {
  final Subscriptions subscriptions;

  const SubscriptionsSuccess(this.subscriptions);
}

class SubscriptionsFailure extends SubscriptionsState {
  final String errMsg;

  const SubscriptionsFailure(this.errMsg);
}

class SubscriptionsLoading extends SubscriptionsState {}

// class AddSubscriptionLoading extends SubscriptionsState {}

// class AddSubscriptionSuccess extends SubscriptionsState {
//   final String message;

//   const AddSubscriptionSuccess(this.message);
// }

// class AddSubscriptionFailure extends SubscriptionsState {
//   final String message;

//   const AddSubscriptionFailure(this.message);
// }
