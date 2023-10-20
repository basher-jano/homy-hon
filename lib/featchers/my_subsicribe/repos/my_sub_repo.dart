import 'package:dartz/dartz.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/my_subsicribe/models/get_my_history_sub.dart';
import 'package:homy_hon/featchers/my_subsicribe/models/get_my_sub_response.dart';

class MySubRepo {
  static Future<Either<String, GetMySubResponse>> getMySub() {
    return BaseApiClient.get(
      url: Links.baseUrl + Links.startPoint + "subscriptions/showMySub",
      converter: (value) {
        return GetMySubResponse.fromJson(value["List"]);
      },
    );
  }
    static Future<Either<String, List<MyHistorySub>>> getMyHistorySub() {
    return BaseApiClient.get(
      url: Links.baseUrl + Links.startPoint + "subscriptions/showAllSubRecord",
      converter: (value) {
        return  MyHistorySub.listFromJson(value["List"]);
      },
    );
  }
}
