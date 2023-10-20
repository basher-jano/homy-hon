import 'package:dio/dio.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/Subscription/data/models/subscriptions_model.dart';
import 'package:dartz/dartz.dart';
import 'package:homy_hon/featchers/Subscription/data/repos/subscriptions_repo.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionsRepoImpl implements SubscriptionsRepo {
  
  @override
  Future<Either<String, Subscriptions>> getAllSubscriptions() async {
    Dio dio = Dio();
SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response = await dio.get('${Links.baseUrl}api/subscriptions/index',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));

      try {
        Subscriptions result = Subscriptions.fromJson(response.data);
        return right(result);
      } on Exception catch (e) {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }

  @override
  Future<Either<String, String>> addSubscription(int subscriptionId) async {
    Dio dio = Dio();
SharedPreferences prefs = await SharedPreferences.getInstance();
     var token=prefs.getString('token');
    try {
      var response =
          await dio.post('${Links.baseUrl}api/subscriptions/subscribe',
              options: Options(
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": "Bearer $token",
                },
              ),
              data: FormData.fromMap({
                "subscription_id": subscriptionId,
                "user_id": prefs.get("id") ?? '12',
              }));
      print(response.data['Message']);

      if (response.data['Code'] == 200) {
        return right(response.data['Message']);
      } else {
        return left(response.data['Message']);
      }
    } on Exception catch (e) {
      return left('Something went wrong, please try again later');
    }
  }
}
