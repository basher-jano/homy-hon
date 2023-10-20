import 'package:dio/dio.dart';
import 'package:homy_hon/featchers/wallet/data/models/wallet_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/wallet/data/repos/wallet_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/remote_date/api_handler/links.dart';

class WalletRepoImpl implements WalletRepo {
  @override
  Future<Either<String, Wallet>> getWallet() async {
    Dio dio = Dio();

   SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');

    try {
      var response = await dio.get('${Links.baseUrl}api/wallets/show',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      print(response.data);
      if (response.data['Status'] == 'Success') {
        Wallet result = Wallet.fromJson(response.data);
        return right(result);
      } else {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
