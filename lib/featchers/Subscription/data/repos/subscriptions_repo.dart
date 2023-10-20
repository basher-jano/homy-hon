import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/Subscription/data/models/subscriptions_model.dart';

abstract class SubscriptionsRepo {
  Future<Either<String, Subscriptions>> getAllSubscriptions();
  Future<Either<String, String>> addSubscription(int subscriptionId);
}
