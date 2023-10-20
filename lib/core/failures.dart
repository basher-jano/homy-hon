import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('connection timeout With ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout With ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout With ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('Receive timeout With ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Connection With ApiServer was canceld');

      case DioErrorType.connectionError:
        return ServerFailure('Connection error With ApiServer');

      case DioErrorType.unknown:
        return ServerFailure('No Internet Connection');
      default:
        return ServerFailure('Opps, There was an Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic respons) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(respons['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your requset not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internel Server Error, Please try later!');
    } else {
      return ServerFailure('Opps, There was an Error, Please try again!');
    }
  }
}
