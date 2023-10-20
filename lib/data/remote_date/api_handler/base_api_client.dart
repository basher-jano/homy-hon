import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/data/remote_date/api_handler/links.dart';
import 'package:homy_hon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dio_errors_handler.dart';
import 'interceptors_handler.dart';
import 'dart:math';

class BaseApiClient {
  static Dio client = Dio();
  static const String _acceptHeader = 'application/json';

  BaseApiClient() {
    client.interceptors.add(LogInterceptor());
    if (kDebugMode) {
      client.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          request: true));
    }
    client.interceptors.add(ClientInterceptor());
    client.options.baseUrl = Links.baseUrl;
  }

  static Future<Either<String, T>> post<T>(
      {required String url,
      FormData? formData,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter,
      Function(String)? saveToken,
      dynamic returnOnError}) async {
    try {
      var response = await client.post(
        url,
        queryParameters: queryParameters,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: {
            'accept': _acceptHeader,
            'authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvbXlob25zeXJpYS4wMDB3ZWJob3N0YXBwLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE2OTE4NDQ2ODAsImV4cCI6MTY5NTQ0NDY4MCwibmJmIjoxNjkxODQ0NjgwLCJqdGkiOiJOUUtJV016ME9NQ0JEQTRiIiwic3ViIjoiMzQiLCJwcnYiOiJjOGVlMWZjODllNzc1ZWM0YzczODY2N2U1YmUxN2E1OTBiNmQ0MGZjIn0.c5Muv-eR6wV36IJEqMWeGSvdnwM2KkjSJ7P-hj8OkCk',
          },
        ),
      );
      if (response.data["Code"] == 200) {
        if (kDebugMode) {
          print(response.data);
        }

        return right(converter(response.data));
      } else {
        return left(response.data['Status']);
      }
    } on DioError catch (e) {
      Map dioError = DioErrorsHandler.onError(e);

      if (kDebugMode) {
        print(e);
      }
      return left(
          returnOnError ?? e.response?.data['Message'] ?? dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(e.toString());
    }
  }

  static Future<Either<String, T>> put<T>(
      {required String url,
      dynamic formData,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter,
      dynamic returnOnError}) async {
    try {
      var response = await client.put(
        url,
        data: formData,
        queryParameters: queryParameters,
        onSendProgress: (int sent, int total) {
          if (kDebugMode) {
            print(
                'progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
          }
        },
        options: Options(
          headers: {
            'accept': _acceptHeader,
            'authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvbXlob24uMDAwd2ViaG9zdGFwcC5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNjg5NzQ5OTM5LCJleHAiOjE3MTk3NDk5MzksIm5iZiI6MTY4OTc0OTkzOSwianRpIjoiZ0lDR283ZElXcmplSVJpQiIsInN1YiI6IjI3IiwicHJ2IjoiYzhlZTFmYzg5ZTc3NWVjNGM3Mzg2NjdlNWJlMTdhNTkwYjZkNDBmYyJ9.EZYQBbekux7EFq2RBkR72upJIpAXcnJBcg2ts9DbZnc',
          },
        ),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return Right(converter(response.data));
    } on DioError catch (e) {
      Map dioError = DioErrorsHandler.onError(e);

      if (kDebugMode) {
        print(e);
      }
      return Left(e.response?.data['message'] ?? dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(e.toString());
    }
  }

  static Future<Either<String, T>> get<T>(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter}) async {
    try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
     
      String? token =  prefs.getString('token');
      var response = await client.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
     
        if (kDebugMode) {
          print("asd");
          print(response.data);
        }
        return Right(converter(response.data));
      } else {
        return left(response.data['Message']);
      }
    } on DioError catch (e) {
      Map dioError = DioErrorsHandler.onError(e);

      if (kDebugMode) {
        print(e.message);
      }
      return left(e.response?.data['Message'] ?? dioError['Message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(e.toString());
    }
  }

  static Future<Either<String, dynamic>> delete(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Function(dynamic) converter}) async {
    try {
      var response = await client.delete(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'accept': _acceptHeader,
            'authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2hvbXlob24uMDAwd2ViaG9zdGFwcC5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNjg5NzQ5OTM5LCJleHAiOjE3MTk3NDk5MzksIm5iZiI6MTY4OTc0OTkzOSwianRpIjoiZ0lDR283ZElXcmplSVJpQiIsInN1YiI6IjI3IiwicHJ2IjoiYzhlZTFmYzg5ZTc3NWVjNGM3Mzg2NjdlNWJlMTdhNTkwYjZkNDBmYyJ9.EZYQBbekux7EFq2RBkR72upJIpAXcnJBcg2ts9DbZnc',
          },
        ),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 205) {
        if (kDebugMode) {
          print(response.data);
        }
        return Right(converter(response.data));
      } else {
        return left(response.data['message']);
      }
    } on DioError catch (e) {
      Map dioError = DioErrorsHandler.onError(e);
      if (kDebugMode) {
        print(e);
      }
      return left(e.response?.data['message'] ?? dioError['message']);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return left(e.toString());
    }
  }
}
