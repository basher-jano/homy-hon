import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/wallet/data/models/wallet_model.dart';

abstract class WalletRepo {
  Future<Either<String, Wallet>> getWallet();
}
