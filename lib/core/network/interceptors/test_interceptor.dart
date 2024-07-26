import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class TestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('PATH:[${options.path}],METHOD: [${options.method}]');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('CODE:[${response.statusCode}]\n DATA: [${response.data}], ');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR:[${err.response?.statusCode}]\n ERROR MESSAGE: [${err.message}], ');

    super.onError(err, handler);
  }
}
