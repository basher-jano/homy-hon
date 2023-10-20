import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/bloc/bloc/sub_details_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/my_subsicribe/view/sub_history_card.dart';

class MySubDetails extends StatelessWidget {
  const MySubDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubDetailsBloc()..add(getSubDetials()),
      child: const MySubDetailsbody(),
    );
  }
}

class MySubDetailsbody extends StatelessWidget {
  const MySubDetailsbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SubDetailsBloc, SubDetailsState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomAppBar(
                      title: 'My Subscription', arrow_back: true),
                ),
              ),
              if (state is Loading) const CircularProgressIndicator(),
              if (state is Success)
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Material(
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
                                          "date :" +
                                              context
                                                  .read<SubDetailsBloc>()
                                                  .getMySubResponse!
                                                  .date
                                                  .toString(),
                                          style: TextStyles.textStyle20
                                              .copyWith(
                                                  fontWeight: FontWeight.w900),
                                        ),
                                      ),
                                      const Divider(color: kBlack),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              'remainingProperty :  ' +
                                                  context
                                                      .read<SubDetailsBloc>()
                                                      .getMySubResponse!
                                                      .remainingProperty
                                                      .toString(),
                                              style: TextStyles.textStyle16,
                                            ),
                                            const SizedBox(height: 30),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 45,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: kLightBlue2,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "",
                                                    style:
                                                        TextStyles.textStyle16,
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
                              ));
                        },
                        itemCount: 1),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
