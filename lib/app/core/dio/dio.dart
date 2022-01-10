import 'package:dio/dio.dart';

import 'interceptor.dart';

class DioFactory {
  static String baseUrl = "https://flutter-task-hala-tech.herokuapp.com";
  static Dio dioSetUp() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      sendTimeout: 10000,
      connectTimeout: 20000,
      receiveTimeout: 40000,
      contentType: "application/json",
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
    return dio;
  }
}
