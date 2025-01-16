import 'package:dio/dio.dart';
import 'access_interceptor.dart';

class DioClient {

  DioClient();

  Dio createDio({bool withAccess = true}) {
    final dio = Dio();

    if (withAccess){
    dio.interceptors.add(
        AccessInterceptor(),
      );
    }
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
