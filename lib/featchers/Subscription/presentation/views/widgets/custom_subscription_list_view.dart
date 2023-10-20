import 'package:flutter/material.dart';
import 'package:homy_hon/featchers/Subscription/data/models/subscriptions_model.dart';
import 'package:homy_hon/featchers/Subscription/presentation/views/widgets/custom_subscription_list_view_item.dart';

class CustomSubscriptionListView extends StatelessWidget {
  const CustomSubscriptionListView({super.key, required this.subscriptions});
  final Subscriptions subscriptions;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: subscriptions.list.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomSubscriptionListViewItem(
          id: subscriptions.list[index].id,
          period: subscriptions.list[index].period,
          propertyNumber: subscriptions.list[index].propertyNumber.toString(),
          title: subscriptions.list[index].name,
          price: '${subscriptions.list[index].price} \$',
        ),
      ),
    ));
  }
}
