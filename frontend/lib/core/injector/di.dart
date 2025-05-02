import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_connector/core/manager/token_manager.dart';
import 'package:travel_connector/core/network/api_error_handler.dart';
import 'package:travel_connector/core/network/dio_client.dart';
import 'package:travel_connector/core/service/local_database_service.dart';
import 'package:travel_connector/core/service/logging_service.dart';
import 'package:travel_connector/core/service/notification_service.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/login_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/datasource/remote/register_remote_datasource.dart';
import 'package:travel_connector/features/auth/data/mapper/access_mapper.dart';
import 'package:travel_connector/features/auth/data/mapper/user_mapper.dart';
import 'package:travel_connector/features/auth/data/repository/login_repository_impl.dart';
import 'package:travel_connector/features/auth/data/repository/register_repository_impl.dart';
import 'package:travel_connector/features/auth/data/service/login_api_service.dart';
import 'package:travel_connector/features/auth/data/service/register_api_service.dart';
import 'package:travel_connector/features/auth/domain/repository/login_repository.dart';
import 'package:travel_connector/features/auth/domain/repository/register_repository.dart';
import 'package:travel_connector/features/auth/domain/usecase/login_usecase.dart';
import 'package:travel_connector/features/auth/domain/usecase/register_usecase.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_create_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_write_comment_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_like_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/datasource/remote/post_remote_datasource.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_write_comment_mapper.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_like_mapper.dart';
import 'package:travel_connector/features/newsfeed/data/mapper/post_mapper.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_comment_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_create_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_write_comment_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_like_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/repository/post_repository_impl.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_api_service.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_comment_api_service.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_create_api_service.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_write_comment_api_service.dart';
import 'package:travel_connector/features/newsfeed/data/service/post_like_api_service.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_comment_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_create_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_write_comment_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_like_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/repository/post_repository.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_comment_usecase.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_create_usecase.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_write_comment_usecase.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_like_usecase.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_usecase.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post/post_bloc.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/follow_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_edit_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_edit_mapper.dart';
import 'package:travel_connector/features/profile/data/mapper/profile_mapper.dart';
import 'package:travel_connector/features/profile/data/repository/profile_edit_repository_impl.dart';
import 'package:travel_connector/features/profile/data/repository/profile_repository_impl.dart';
import 'package:travel_connector/features/profile/data/service/follow_api_service.dart';
import 'package:travel_connector/features/profile/data/service/profile_api_service.dart';
import 'package:travel_connector/features/profile/data/service/profile_edit_api_service.dart';
import 'package:travel_connector/features/profile/domain/repository/follow_repository.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_edit_repository.dart';
import 'package:travel_connector/features/profile/domain/repository/profile_repository.dart';
import 'package:travel_connector/features/profile/domain/usecase/follow_usecase.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_edit_usecase.dart';
import 'package:travel_connector/features/profile/domain/usecase/profile_usecase.dart';
import 'package:travel_connector/features/search/data/datasource/remote/city_remote_datasource.dart';
import 'package:travel_connector/features/search/data/datasource/remote/hotel_remote_datasource.dart';
import 'package:travel_connector/features/search/data/datasource/remote/places_remote_datasource.dart';
import 'package:travel_connector/features/search/data/datasource/remote/weather_remote_datasource.dart';
import 'package:travel_connector/features/search/data/mapper/city_mapper.dart';
import 'package:travel_connector/features/search/data/mapper/hotel_mapper.dart';
import 'package:travel_connector/features/search/data/mapper/places_mapper.dart';
import 'package:travel_connector/features/search/data/mapper/weather_mapper.dart';
import 'package:travel_connector/features/search/data/repository/city_repository_impl.dart';
import 'package:travel_connector/features/search/data/repository/hotel_repository_impl.dart';
import 'package:travel_connector/features/search/data/repository/places_repository_impl.dart';
import 'package:travel_connector/features/search/data/repository/weather_repository_impl.dart';
import 'package:travel_connector/features/search/data/service/city_api_service.dart';
import 'package:travel_connector/features/search/data/service/hotel_api_service.dart';
import 'package:travel_connector/features/search/data/service/places_api_service.dart';
import 'package:travel_connector/features/search/data/service/weather_api_service.dart';
import 'package:travel_connector/features/search/domain/repository/city_repository.dart';
import 'package:travel_connector/features/search/domain/repository/hotel_repository.dart';
import 'package:travel_connector/features/search/domain/repository/places_repository.dart';
import 'package:travel_connector/features/search/domain/repository/weather_repository.dart';
import 'package:travel_connector/features/search/domain/usecase/city_usecase.dart';
import 'package:travel_connector/features/search/domain/usecase/hotel_usecase.dart';
import 'package:travel_connector/features/search/domain/usecase/places_usecase.dart';
import 'package:travel_connector/features/search/domain/usecase/weather_usecase.dart';
import 'package:travel_connector/features/search/domain/utils/weather_util.dart';

import '../../features/profile/data/repository/follow_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Logger
  getIt.registerSingleton<LoggingService>(LoggingService.create());

  // ErrorHandler
  getIt.registerSingleton<ErrorHandler>(
    ApiErrorHandler(),
  );

  // LocalDB
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => FlutterSecureStorage());
  getIt.registerLazySingleton<LocalDatabaseService>(
    () => LocalDatabaseService(sharedPreferences),
  );
  getIt.registerLazySingleton<TokenManager>(
    () => TokenManager(
      getIt<FlutterSecureStorage>(),
    ),
  );

  // NotificationService
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(),
  );
  getIt.registerLazySingleton<NotificationCubit>(
    () => NotificationCubit(
      getIt<NotificationService>(),
    ),
  );

  // Session
  getIt.registerLazySingleton<SessionBloc>(
    () => SessionBloc(
      getIt<TokenManager>(),
    ),
  );

  // Dio
  getIt.registerLazySingleton<Dio>(
    () => DioClient(
      getIt<TokenManager>(),
      getIt<SessionBloc>(),
      getIt<NotificationCubit>(),
    ).createDio(withAccess: true),
    instanceName: "dioWithAccess",
  );
  getIt.registerLazySingleton<Dio>(
    () => DioClient(
      getIt<TokenManager>(),
      getIt<SessionBloc>(),
      getIt<NotificationCubit>(),
    ).createDio(withAccess: false),
    instanceName: "dioWithoutAccess",
  );

  //// Auth
  getIt.registerLazySingleton<UserMapper>(
    () => UserMapper(),
  );
  getIt.registerLazySingleton<AccessMapper>(
    () => AccessMapper(),
  );
  // Login
  getIt.registerLazySingleton<LoginApiService>(
    () => LoginApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(
      getIt<LoginApiService>(),
    ),
  );
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      getIt<LoginRemoteDataSource>(),
      getIt<AccessMapper>(),
      getIt<ErrorHandler>(),
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
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(
      getIt<RegisterApiService>(),
    ),
  );
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      getIt<RegisterRemoteDataSource>(),
      getIt<AccessMapper>(),
      getIt<ErrorHandler>(),
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
      getIt<Dio>(instanceName: 'dioWithAccess'),
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
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PostUseCase(
      getIt<PostRepository>(),
    ),
  );

  // Like
  getIt.registerLazySingleton<PostLikeMapper>(
    () => PostLikeMapper(),
  );
  getIt.registerLazySingleton<PostLikeApiService>(
    () => PostLikeApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<PostLikeRemoteDataSource>(
    () => PostLikeRemoteDataSource(
      getIt<PostLikeApiService>(),
    ),
  );
  getIt.registerLazySingleton<PostLikeRepository>(
    () => PostLikeRepositoryImpl(
      getIt<PostLikeRemoteDataSource>(),
      getIt<PostLikeMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PostLikeUseCase(
      getIt<PostLikeRepository>(),
    ),
  );

  // WriteComment
  getIt.registerLazySingleton<PostWriteCommentMapper>(
    () => PostWriteCommentMapper(),
  );
  getIt.registerLazySingleton<PostWriteCommentApiService>(
    () => PostWriteCommentApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<PostWriteCommentRemoteDataSource>(
    () => PostWriteCommentRemoteDataSource(
      getIt<PostWriteCommentApiService>(),
    ),
  );
  getIt.registerLazySingleton<PostWriteCommentRepository>(
    () => PostWriteCommentRepositoryImpl(
      getIt<PostWriteCommentRemoteDataSource>(),
      getIt<PostWriteCommentMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PostWriteCommentUseCase(
      getIt<PostWriteCommentRepository>(),
    ),
  );

  // FetchComment
  getIt.registerLazySingleton<PostCommentMapper>(
    () => PostCommentMapper(),
  );
  getIt.registerLazySingleton<PostCommentApiService>(
    () => PostCommentApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<PostCommentRemoteDataSource>(
    () => PostCommentRemoteDataSource(
      getIt<PostCommentApiService>(),
    ),
  );
  getIt.registerLazySingleton<PostCommentRepository>(
    () => PostCommentRepositoryImpl(
      getIt<PostCommentRemoteDataSource>(),
      getIt<PostCommentMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PostCommentUseCase(
      getIt<PostCommentRepository>(),
    ),
  );

  //// Profile
  // FetchProfile
  getIt.registerLazySingleton<ProfileMapper>(
    () => ProfileMapper(
      postMapper: getIt<PostMapper>()
    ),
  );
  getIt.registerLazySingleton<ProfileApiService>(
    () => ProfileApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSource(
      getIt<ProfileApiService>(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      getIt<ProfileRemoteDataSource>(),
      getIt<ProfileMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton<ProfileUseCase>(
    () => ProfileUseCase(
      getIt<ProfileRepository>(),
    ),
  );

  // ExecuteEdit
  getIt.registerLazySingleton<ProfileEditMapper>(
    () => ProfileEditMapper(),
  );
  getIt.registerLazySingleton<ProfileEditApiService>(
    () => ProfileEditApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<ProfileEditRemoteDataSource>(
    () => ProfileEditRemoteDataSource(
      getIt<ProfileEditApiService>(),
    ),
  );
  getIt.registerLazySingleton<ProfileEditRepository>(
    () => ProfileEditRepositoryImpl(
      getIt<ProfileEditRemoteDataSource>(),
      getIt<ProfileEditMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ProfileEditUseCase(
      getIt<ProfileEditRepository>(),
    ),
  );

  //// Search
  // Weather
  getIt.registerLazySingleton<WeatherMapper>(
    () => WeatherMapper(),
  );
  getIt.registerLazySingleton<WeatherUtil>(
    () => WeatherUtil(),
  );
  getIt.registerLazySingleton<WeatherApiService>(
    () => WeatherApiService(
      getIt<Dio>(instanceName: 'dioWithoutAccess'),
    ),
  );
  getIt.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSource(
      getIt<WeatherApiService>(),
    ),
  );
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      getIt<WeatherRemoteDataSource>(),
      getIt<WeatherMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => WeatherUseCase(
      getIt<WeatherRepository>(),
    ),
  );

  // Places
  getIt.registerLazySingleton<PlacesMapper>(
    () => PlacesMapper(),
  );
  getIt.registerLazySingleton<PlacesApiService>(
    () => PlacesApiService(
      getIt<Dio>(instanceName: 'dioWithoutAccess'),
    ),
  );
  getIt.registerLazySingleton<PlacesRemoteDataSource>(
    () => PlacesRemoteDataSource(
      getIt<PlacesApiService>(),
    ),
  );
  getIt.registerLazySingleton<PlacesRepository>(
    () => PlacesRepositoryImpl(
      getIt<PlacesRemoteDataSource>(),
      getIt<PlacesMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => PlacesUseCase(
      getIt<PlacesRepository>(),
    ),
  );

  // City Prediction
  getIt.registerLazySingleton<CityMapper>(
    () => CityMapper(),
  );
  getIt.registerLazySingleton<CityApiService>(
    () => CityApiService(
      getIt<Dio>(instanceName: 'dioWithoutAccess'),
    ),
  );
  getIt.registerLazySingleton<CityRemoteDataSource>(
    () => CityRemoteDataSource(
      getIt<CityApiService>(),
    ),
  );
  getIt.registerLazySingleton<CityRepository>(
    () => CityRepositoryImpl(
      getIt<CityRemoteDataSource>(),
      getIt<CityMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => CityUseCase(
      getIt<CityRepository>(),
    ),
  );

  // Hotel
  getIt.registerLazySingleton<HotelMapper>(
    () => HotelMapper(),
  );
  getIt.registerLazySingleton<HotelApiService>(
    () => HotelApiService(
      getIt<Dio>(instanceName: 'dioWithoutAccess'),
    ),
  );
  getIt.registerLazySingleton<HotelRemoteDataSource>(
    () => HotelRemoteDataSource(
      getIt<HotelApiService>(),
    ),
  );
  getIt.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      getIt<HotelRemoteDataSource>(),
      getIt<HotelMapper>(),
      getIt<ErrorHandler>(),
    ),
  );
  getIt.registerLazySingleton(
    () => HotelUseCase(
      getIt<HotelRepository>(),
    ),
  );

  // Post Create
  getIt.registerLazySingleton<PostCreateApiService>(
        () => PostCreateApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<PostCreateRemoteDataSource>(
        () => PostCreateRemoteDataSource(
         dio: getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );

  getIt.registerLazySingleton<PostCreateRepository>(
        () => PostCreateRepositoryImpl(
      getIt<PostCreateRemoteDataSource>(),
      getIt<ErrorHandler>(),
    ),
  );

  getIt.registerLazySingleton(
        () => PostCreateUseCase(
      getIt<PostCreateRepository>(),
    ),
  );

  // Follow
  getIt.registerLazySingleton<FollowApiService>(
        () => FollowApiService(
      getIt<Dio>(instanceName: 'dioWithAccess'),
    ),
  );
  getIt.registerLazySingleton<FollowRemoteDataSource>(
        () => FollowRemoteDataSource(
      getIt<FollowApiService>(),
    ),
  );

  getIt.registerLazySingleton<FollowRepository>(
        () => FollowRepositoryImpl(
      getIt<FollowRemoteDataSource>(),
      getIt<ErrorHandler>(),
    ),
  );

  getIt.registerLazySingleton(
        () => FollowUseCase(
      getIt<FollowRepository>(),
    ),
  );

}
