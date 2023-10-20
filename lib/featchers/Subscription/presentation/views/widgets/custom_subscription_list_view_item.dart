import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/Subscription/presentation/manager/subscription_bloc/subscriptions_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class CustomSubscriptionListViewItem extends StatelessWidget {
  const CustomSubscriptionListViewItem(
      {super.key,
      required this.title,
      required this.price,
      required this.propertyNumber,
      required this.period,
      required this.id});

  final int  id;
  final String propertyNumber;
  final String period;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: TextStyles.textStyle20
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            const Divider(color: kBlack),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    'property number : $propertyNumber property',
                    style: TextStyles.textStyle16,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Period : $period days',
                    style: TextStyles.textStyle16,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 45,
                        child:
                            BlocConsumer<SubscriptionsBloc, SubscriptionsState>(
                          listener: (context, state) {
                            if (context
                                            .read<SubscriptionsBloc>()
                                            .addSubscrptionSuccess ==
                                        true &&
                                    context
                                            .read<SubscriptionsBloc>()
                                            .subscriptionId ==
                                        id
                                //     &&
                                // context
                                //         .read<SubscriptionsBloc>()
                                //         .addSubscrptionLoading ==
                                //     false
                                ) {
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            context
                                                .read<SubscriptionsBloc>()
                                                .addSubscriptonMessage!,
                                            style: TextStyles.textStyle18,
                                          ),
                                        )),
                                  ),
                                ),
                              );
                              print('success');
                              print(context
                                  .read<SubscriptionsBloc>()
                                  .addSubscriptonMessage);
                              // context
                              //     .read<SubscriptionsBloc>()
                              //     .addSubscriptonMessage = null;
                              context
                                  .read<SubscriptionsBloc>()
                                  .addSubscrptionSuccess = null;
                            } else if (context
                                            .read<SubscriptionsBloc>()
                                            .addSubscrptionSuccess ==
                                        false &&
                                    context
                                            .read<SubscriptionsBloc>()
                                            .subscriptionId ==
                                        id
                                //     &&
                                // context
                                //         .read<SubscriptionsBloc>()
                                //         .addSubscrptionLoading ==
                                //     false
                                ) {
                              print('fail');
                              print(context
                                  .read<SubscriptionsBloc>()
                                  .addSubscriptonMessage);
                              showDialog(
                                context: context,
                                builder: (context) => Center(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kWhite,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            context
                                                .read<SubscriptionsBloc>()
                                                .addSubscriptonMessage!,
                                            style: TextStyles.textStyle18,
                                          ),
                                        )),
                                  ),
                                ),
                              );

                              print(context
                                  .read<SubscriptionsBloc>()
                                  .addSubscriptonMessage);
                              // context
                              //     .read<SubscriptionsBloc>()
                              //     .addSubscriptonMessage = null;
                              context
                                  .read<SubscriptionsBloc>()
                                  .addSubscrptionSuccess = null;
                            }
                          },
                          builder: (context, state) {
                            if (context
                                        .read<SubscriptionsBloc>()
                                        .addSubscrptionLoading ==
                                    true &&
                                context
                                        .read<SubscriptionsBloc>()
                                        .subscriptionId ==
                                    id) {
                              return Container(
                                  decoration: const BoxDecoration(
                                      color: kDarkBlue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: kWhite,
                                      ),
                                    ),
                                  ));
                            } else {
                              return CustomElevatedButton(
                                title: 'Subscribe',
                                onPressed: () {
                                  context
                                      .read<SubscriptionsBloc>()
                                      .add(AddSubscriptionEvent(id));
                                  context
                                      .read<SubscriptionsBloc>()
                                      .subscriptionId = id;
                                },
                                color: kDarkBlue,
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: kLightBlue2,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                        ),
                        child: Center(
                            child: Text(
                          price,
                          style: TextStyles.textStyle16,
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
