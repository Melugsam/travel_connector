import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_connector/core/manager/notification_manager.dart';
import 'package:travel_connector/core/manager/user_manager.dart';
import 'package:travel_connector/core/network/dio_client.dart';
import 'package:travel_connector/core/service/local_database.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/core/service/notification_service.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/login_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/register_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/mapper/user_mapper.dart';
import 'package:travel_connector/features/auth/data/repository/login_repository_impl.dart';
import 'package:travel_connector/features/auth/data/repository/register_repository_impl.dart';
import 'package:travel_connector/features/auth/data/service/login_api_service.dart';
import 'package:travel_connector/features/auth/data/service/register_api_service.dart';
import 'package:travel_connector/features/auth/domain/repository/login_repository.dart';
import 'package:travel_connector/features/auth/domain/repository/register_repository.dart';
import 'package:travel_connector/features/auth/domain/usecase/login_usecase.dart';
import 'package:travel_connector/features/auth/domain/usecase/register_usecase.dart';
import 'package:travel_connector/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:travel_connector/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_mapper.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_api_service.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Logger
  getIt.registerSingleton<LoggingService>(LoggingService.create());

  // LocalDB
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton<LocalDatabase>(
    () => LocalDatabase(sharedPreferences),
  );

  // UserManager
  getIt.registerLazySingleton<UserManager>(
    () => UserManager(
      getIt<LocalDatabase>(),
    ),
  );

  // NotificationManager
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(),
  );
  getIt.registerLazySingleton<NotificationManager>(
    () => NotificationManager(
      getIt<NotificationService>(),
    ),
  );

  // Dio
  getIt.registerLazySingleton<Dio>(
    () => DioClient().createDio(),
  );

  //// Auth
  getIt.registerLazySingleton<UserMapper>(
    () => UserMapper(),
  );
  // Login
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(
      getIt<LoginApiService>(),
    ),
  );
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      getIt<LoggingService>(),
      getIt<LoginRemoteDataSource>(),
      getIt<UserMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => LoginUseCase(
      getIt<LoginRepository>(),
    ),
  );

  // Register
  getIt.registerLazySingleton<RegisterApiService>(
    () => RegisterApiService(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(
      getIt<RegisterApiService>(),
    ),
  );
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      getIt<LoggingService>(),
      getIt<RegisterRemoteDataSource>(),
      getIt<UserMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => RegisterUseCase(
      getIt<RegisterRepository>(),
    ),
  );

  //// Newsfeed
  // Post
  getIt.registerLazySingleton<PostMapper>(
    () => PostMapper(),
  );
  getIt.registerLazySingleton<PostApiService>(
    () => PostApiService(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSource(
      getIt<PostApiService>(),
    ),
  );
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      getIt<PostRemoteDataSource>(),
      getIt<PostMapper>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PostUseCase(
      getIt<PostRepository>(),
    ),
  );
}
