import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    print(dioException.type);
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receiveTimeOut");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("requestCanceled");
      case DioExceptionType.unknown:
        if (dioException.error!.toString().contains("SocketException")) {
          return ServerFailure("noInternet");
        } else {
          return ServerFailure("unexpectedError");
        }
      default:
        return ServerFailure("Something went Error Try Again");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 405) {
      print("responseresponse ${response}");

      if (response["detail"] != null) {
        return ServerFailure(response["detail"]);
      } else if (response["message"] != null) {
        return ServerFailure(response["message"]);
      } else {
        Map<String, dynamic> res = response;
        return ServerFailure(res.values.first
            .toString()
            .replaceAll("[", "")
            .replaceAll("]", ""));
      }
    } else if (statusCode == 500) {
      return ServerFailure("internalServerError");
    } else if (statusCode == 404) {
      return ServerFailure("requestNotFound");
    } else {
      print("asasas ${statusCode}");
      return ServerFailure("Something went Error Try Again");
    }
  }
}
