import 'package:app_web/data/api/api_constant.dart';
import 'package:dio/dio.dart';
import 'response_interceptors.dart';

class Api {
  final Dio dio = createDio();

  Api._internal();

  static final Api _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstant.url,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
        Headers.acceptHeader: Headers.jsonContentType,
      },
    ));

    dio.interceptors.addAll([
      CustomResponseInterceptors(dio),
    ]);

    return dio;
  }
}
