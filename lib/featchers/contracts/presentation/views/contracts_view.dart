import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/contracts_bloc/contracts_bloc_bloc.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/widgets/contracts_list_view.dart';

class ContractsView extends StatelessWidget {
  const ContractsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kAddContractView);
        },
        backgroundColor: kDarkBlue,
        child: const Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
      body: Column(
        children: [
          CustomAppBar(title: 'Contracts', arrow_back: true),
          BlocBuilder<ContractsBloc, ContractsState>(
            bloc: context.read<ContractsBloc>().contracts == null
                ? (context.read<ContractsBloc>()..add(GetContractsEvent()))
                : null,
            builder: (context, state) {
              if (state is ContractsBlocSuccess) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<ContractsBloc>().add(GetContractsEvent());
                    },
                    child: context.read<ContractsBloc>().contracts!.list.isEmpty
                        ? ListView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: const [
                              SizedBox(height: 50),
                              Center(
                                child: Text(
                                  'You dont have contracts yet',
                                  style: TextStyles.textStyle18,
                                ),
                              ),
                            ],
                          )
                        : ContractsListView(
                            contracts:
                                context.read<ContractsBloc>().contracts!),
                  ),
                );
              } else if (state is ContractsBlocFailure) {
                return Center(
                  child: Text(state.errMsg, style: TextStyles.textStyle18),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    ));
  }
}
