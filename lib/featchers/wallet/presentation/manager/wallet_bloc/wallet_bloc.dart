import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homy_hon/featchers/wallet/data/models/wallet_model.dart';
import 'package:homy_hon/featchers/wallet/data/repos/wallet_repo.dart';
import 'package:homy_hon/featchers/wallet/data/repos/wallet_repo_impl.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  Wallet? wallet;
  WalletBloc(WalletRepoImpl walletRepoImpl) : super(WalletInitial()) {
    WalletRepo walletRepo = walletRepoImpl;
    on<WalletEvent>((event, emit) async {
      if (event is WalletInitialEvent) {
        emit(WalletLoading());
        var result = await walletRepo.getWallet();
        result.fold(
          (l) => emit(WalletFailure(l)),
          (r) {
            wallet = r;
            emit(WalletSuccess());
          },
        );
      }
    });
  }
}
