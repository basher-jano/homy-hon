import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/bloc/my__subscibtion/mysubsicribtion_bloc.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';

import 'sub_history_card.dart';

class HistorySubScreen extends StatelessWidget {
  const HistorySubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MysubsicribtionBloc()..add(HistorySub()),
      child: const HistorySubScreenbody(),
    );
  }
}

class HistorySubScreenbody extends StatelessWidget {
  const HistorySubScreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MysubsicribtionBloc, MysubsicribtionState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomAppBar(title: 'History', arrow_back: true),
              ),
              if (state is Loading) CircularProgressIndicator(),
              context.read<MysubsicribtionBloc>().myHistoryList == []
                  ? Center(
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                  "theere is not any sub in your history")),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CustomSubHistoryCard(
                                  endIN: context
                                      .read<MysubsicribtionBloc>()
                                      .myHistoryList[index]
                                      .endIn,
                                  period: context
                                      .read<MysubsicribtionBloc>()
                                      .myHistoryList[index]
                                      .peroid,
                                  title: context
                                      .read<MysubsicribtionBloc>()
                                      .myHistoryList[index]
                                      .name,
                                ),
                              );
                            },
                            itemCount: context
                                .read<MysubsicribtionBloc>()
                                .myHistoryList
                                .length),
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
