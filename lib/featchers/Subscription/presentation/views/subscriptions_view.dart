import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/featchers/Subscription/presentation/manager/subscription_bloc/subscriptions_bloc.dart';
import 'package:homy_hon/featchers/Subscription/presentation/views/widgets/custom_subscription_list_view.dart';
import 'package:homy_hon/featchers/Subscription/presentation/views/widgets/custom_subscription_list_view_item.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: "Subscriptions", arrow_back: true),
            BlocBuilder<SubscriptionsBloc, SubscriptionsState>(
              bloc: context.read<SubscriptionsBloc>().subscriptions == null
                  ? (context.read<SubscriptionsBloc>()
                    ..add(SubscriptionsInitialEvent()))
                  : null,
              builder: (context, state) {
                if (context.read<SubscriptionsBloc>().subscriptions != null) {
                  return CustomSubscriptionListView(
                    subscriptions:
                        context.read<SubscriptionsBloc>().subscriptions!,
                  );
                } else {
                  if (state is SubscriptionsSuccess) {
                    return CustomSubscriptionListView(
                      subscriptions: state.subscriptions,
                    );
                  } else if (state is SubscriptionsFailure) {
                    return Center(
                      child: Text(
                        state.errMsg,
                        style: const TextStyle(color: kBlack),
                      ),
                    );
                  } else if (state is SubscriptionsLoading) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
