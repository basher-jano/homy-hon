import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/wallet/presentation/manager/wallet_bloc/wallet_bloc.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppBar(title: 'My Wallet', arrow_back: true),
          const SizedBox(height: 50),
          Center(
            child: BlocBuilder<WalletBloc, WalletState>(
              bloc: context.read<WalletBloc>().wallet == null
                  ? (context.read<WalletBloc>()..add(WalletInitialEvent()))
                  : null,
              builder: (context, state) {
                if (state is WalletSuccess) {
                  return Text(
                      'Your wallet amount is : ${context.read<WalletBloc>().wallet!.wallet.amount}',
                      style: TextStyles.textStyle20.copyWith(
                          color: kDarkBlue, fontWeight: FontWeight.bold));
                } else if (state is WalletFailure) {
                  return Text(
                    state.errMsg,
                    style: TextStyles.textStyle20.copyWith(color: kLightBlue),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
