import 'package:dartz/dartz.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/featchers/Login/data/models/notfication_model/all_notfication_response.dart';

class NotficationRepo {
  static Future<Either<String, List<AllNotficationResponse>>>
      getAllNotfication() {
    return BaseApiClient.get<List<AllNotficationResponse>>(
      url: Links.baseUrl + Links.startPoint + "notification/show_all",
      converter: (value) {
        return AllNotficationResponse.listFromJson(value["List"]);
      },
    );
  }

  static Future<Either<String, String>> changeNotficationState(int id) {
    return BaseApiClient.get<String>(
      url: Links.baseUrl +
          Links.startPoint +
          "notification/update/" +
          id.toString(),
      converter: (value) {
        return value["Message"];
      },
    );
  }
}
