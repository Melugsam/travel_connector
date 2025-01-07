import 'package:dio/dio.dart';
import 'access_interceptor.dart';

class DioClient {

  DioClient();

  Dio createDio() {
    final dio = Dio();

    dio.interceptors.add(
      AccessInterceptor(),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    );

    dio.options
      ..headers = {'Content-Type': 'application/json'}
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);

    return dio;
  }
}
