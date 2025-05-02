// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:travel_connector/core/constant/url.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';

class AccessInterceptor extends Interceptor {
  final TokenManager _tokenManager;
  final SessionBloc _sessionBloc;
  final NotificationCubit _notificationCubit;

  AccessInterceptor(
    this._tokenManager,
    this._sessionBloc,
    this._notificationCubit,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final baseUrl = serviceUrl;
    final accessToken = await _tokenManager.getAccessToken();
    if (baseUrl != null) {
      options.baseUrl = baseUrl;
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _tokenManager.clearAccessToken();
      _sessionBloc.add(
        LogoutSessionEvent(),
      );
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.response?.statusCode == 500) {
      _notificationCubit.showError(
        message: "Сервис недоступен, попробуйте позднее",
      );
    }
    handler.next(err);
  }
}
