import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';
import 'access_interceptor.dart';

class DioClient {
  final TokenManager _tokenManager;
  final SessionBloc _sessionBloc;
  final NotificationCubit _notificationCubit;

  DioClient(
    this._tokenManager,
    this._sessionBloc,
    this._notificationCubit,
  );

  Dio createDio({bool withAccess = true}) {
    final dio = Dio();

    if (withAccess) {
      dio.interceptors.addAll(
        [
          TalkerDioLogger(
            settings: const TalkerDioLoggerSettings(
              printRequestHeaders: true,
              printResponseHeaders: true,
              printResponseMessage: true,
            ),
          ),
          AccessInterceptor(
            _tokenManager,
            _sessionBloc,
            _notificationCubit,
          ),
        ],
      );
    }

    dio.options
      ..headers = {'Content-Type': 'application/json'}
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5);

    return dio;
  }
}
