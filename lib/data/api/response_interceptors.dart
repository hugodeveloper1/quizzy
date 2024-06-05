import 'package:dio/dio.dart';

import 'client_error.dart';

class CustomResponseInterceptors extends Interceptor {
  CustomResponseInterceptors(this.dio);
  final Dio dio;

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return handler.next(err);
      case DioExceptionType.sendTimeout:
        return handler.next(err);

      case DioExceptionType.receiveTimeout:
        return handler.next(err);

      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 301:
            return handler.next(err);

          case 400:
            return handler.next(err);
          case 403:
            return handler.next(err);
          case 404:
            return handler.next(err);
          case 401:
            // throw CustomUnauthorizedException(err.requestOptions);
            return handler.next(err);
          case 409:
            return handler.next(err);
          case 500:
            return handler.next(err);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw CustomNoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badCertificate:
        throw CustomNoInternetConnectionException(err.requestOptions);

      case DioExceptionType.connectionError:
        throw CustomNoInternetConnectionException(err.requestOptions);
    }
  }
}
