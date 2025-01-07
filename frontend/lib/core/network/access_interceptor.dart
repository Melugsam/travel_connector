import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/url.dart';

class AccessInterceptor extends Interceptor {

  AccessInterceptor(
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final baseUrl = serviceUrl;

    if (baseUrl != null) {
      options.baseUrl = baseUrl;
    }

    handler.next(options);
  }
}
