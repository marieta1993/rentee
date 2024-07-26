import 'package:dio/dio.dart';
import 'package:rentee/core/network/constants.dart';
import 'package:rentee/core/network/interceptors/test_interceptor.dart';

class DioClient {
  DioClient._();
  static DioClient instance = DioClient._();

  Dio get dio => Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 10),
      contentType: "application/json"))
    ..interceptors.add(TestInterceptor());
}
