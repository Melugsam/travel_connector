import 'package:dio/dio.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';
import 'access_interceptor.dart';

class DioClient {
  final TokenManager _tokenManager;
  final SessionBloc _sessionBloc;

  DioClient(
    this._tokenManager,
    this._sessionBloc,
  );

  Dio createDio({bool withAccess = true}) {
    final dio = Dio();

    if (withAccess) {
      dio.interceptors.add(
        AccessInterceptor(
          _tokenManager,
          _sessionBloc,
        ),
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
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5);

    return dio;
  }
}
