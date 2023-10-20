import "package:dio/dio.dart";
import "package:homy_hon/core/config/user_information.dart";
import "package:homy_hon/main.dart";
import "package:shared_preferences/shared_preferences.dart";

class ClientInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    options.headers = {
      // "Content-Type": Headers.jsonContentType,
      // "Content-Type": "text/html",
      "Authorization": 'Bearer $token',
      // "Accept": Headers.jsonContentType,
      // "Accept": '*/*',
      // "AcceptApplication/json": Headers.jsonContentType,
    };
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data == "error") {
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
          error: response.data["msg"] ?? response.data["message"],
          type: DioErrorType.badResponse,
        ),
      );
    } else {
      handler.resolve(response);
    }
  }
}
