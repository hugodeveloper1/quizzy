import 'package:dio/dio.dart';

class CustomBadRequestException extends DioException {
  CustomBadRequestException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: Bad Request';
  }
}

class CustomInternalServerErrorException extends DioException {
  CustomInternalServerErrorException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: An unknown error occurred, please try again later.';
  }
}

class CustomConflictException extends DioException {
  CustomConflictException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: Conflict occurred';
  }
}

class CustomUnauthorizedException extends DioException {
  CustomUnauthorizedException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: Access denied';
  }
}

class CustomNotFoundException extends DioException {
  CustomNotFoundException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: The requested information could not be found';
  }
}

class CustomNoInternetConnectionException extends DioException {
  CustomNoInternetConnectionException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: No internet connection detected, please try again.';
  }
}

class CustomDeadlineExceededException extends DioException {
  CustomDeadlineExceededException(RequestOptions request)
      : super(requestOptions: request);

  @override
  String toString() {
    return 'Error: The connection has timed out, please try again.';
  }
}
