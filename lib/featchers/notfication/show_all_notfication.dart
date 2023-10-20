import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/dialog/error_dialog.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

import '../../bloc/notfication/notfication_bloc.dart';

class ShowAllNotficatonView extends StatelessWidget {
  const ShowAllNotficatonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotficationBloc()..add(GetNotficationEvent()),
      child: ShowAllNotficatonViewBody(),
    );
  }
}

class ShowAllNotficatonViewBody extends StatelessWidget {
  const ShowAllNotficatonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NotficationBloc, NotficationState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomAppBar(title: 'Notfication', arrow_back: true),
                  ),
                  const Divider(color: Colors.white),
                  if (state is Loading)
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Color(0xFFe2e4e9),
                                      child: const SizedBox(
                                        height: 55,
                                        child: VerticalDivider(
                                          thickness: 4,
                                          color: kDarkBlue,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 17,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Color(0xFFe2e4e9),
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        color: Color(0xFFe2e4e9),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 27,
                                    ),
                                    Expanded(
                                      child: Shimmer.fromColors(
                                          child: Container(
                                            height: 50,
                                            width: 100,
                                            color: Color(0xFFe2e4e9),
                                          ),
                                          baseColor: Colors.grey,
                                          highlightColor: Color(0xFFe2e4e9)),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: 4),
                      ),
                    ),
                  context.read<NotficationBloc>().notficationList == []
                      ? Center(
                          child: Text(
                            "there is no notification now ",
                            style: TextStyle(color: kDarkBlue),
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  print(context
                                      .read<NotficationBloc>()
                                      .notficationList[index]
                                      .seen);
                                  return Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Container(
                                            color: context
                                                        .read<NotficationBloc>()
                                                        .notficationList[index]
                                                        .seen ==
                                                    "false"
                                                ? Colors.grey.withOpacity(0.2)
                                                : Colors.white.withOpacity(0.8),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  height: 55,
                                                  child: VerticalDivider(
                                                    thickness: 4,
                                                    color: kDarkBlue,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 17,
                                                ),
                                                Container(
                                                  width: 28,
                                                  height: 28,
                                                  color: kDarkBlue,
                                                ),
                                                const SizedBox(
                                                  width: 27,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      style: TextStyle(
                                                          height: 1,
                                                          color: kDarkBlue),
                                                      context
                                                          .read<
                                                              NotficationBloc>()
                                                          .notficationList[
                                                              index]
                                                          .description),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            if (context
                                                    .read<NotficationBloc>()
                                                    .notficationList[index]
                                                    .seen ==
                                                "false") {
                                              context
                                                  .read<NotficationBloc>()
                                                  .add(UpdateNotficationState(
                                                      index: index,
                                                      id: context
                                                          .read<
                                                              NotficationBloc>()
                                                          .notficationList[
                                                              index]
                                                          .id));
                                            }

                                            showDialog(
                                                context: context,
                                                builder: (dialogcontex) {
                                                  return Center(
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: kDarkBlue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                        height: 150,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(context
                                                                        .read<
                                                                            NotficationBloc>()
                                                                        .notficationList[
                                                                            index]
                                                                        .description),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child: Text(context
                                                                  .read<
                                                                      NotficationBloc>()
                                                                  .notficationList[
                                                                      index]
                                                                  .recivedAt),
                                                            )
                                                          ],
                                                        )),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Show more",
                                            style: TextStyle(color: kDarkBlue),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                itemCount: context
                                    .read<NotficationBloc>()
                                    .notficationList
                                    .length),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
