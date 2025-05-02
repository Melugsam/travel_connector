import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/features/app/presentation/bloc/notification/notification_cubit.dart';
import 'package:travel_connector/features/app/presentation/server_error_screen.dart';
import 'package:travel_connector/features/app/presentation/splash_screen.dart';
import 'package:travel_connector/features/auth/presentation/login_screen.dart';
import 'package:travel_connector/features/auth/presentation/register_screen.dart';
import 'package:travel_connector/features/navigation/presentation/navigation_screen.dart';
import 'package:travel_connector/features/newsfeed/data/model/post_response_model.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_create_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/domain/usecase/post_create_usecase.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_create/post_create_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/screen/add_map_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/screen/add_post_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/screen/comments_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/screen/newsfeed_screen.dart';
import 'package:travel_connector/features/profile/presentation/edit_profile_screen.dart';
import 'package:travel_connector/features/profile/presentation/my_profile_screen.dart';
import 'package:travel_connector/features/profile/presentation/other_profile_screen.dart';
import 'package:travel_connector/features/search/presentation/search_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter route = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/splash",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/server-error',
      name: 'server-error',
      builder: (context, state) => ServerErrorScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final int userId = state.extra as int;
        return OtherProfileScreen(userId: userId);
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/newsfeed',
              name: "newsfeed",
              pageBuilder: (context, state) => const NoTransitionPage(
                child: NewsfeedScreen(),
              ),
              routes: [
                GoRoute(
                  path: '/comments',
                  name: 'comments',
                  builder: (context, state) {
                    final PostEntity post = state.extra as PostEntity;
                    return CommentsScreen(
                      post: post,
                    );
                  },
                ),
                GoRoute(
                  path: '/add-post',
                  name: 'addPost',
                  parentNavigatorKey: _rootNavigatorKey,
                  routes: [
                    GoRoute(
                      path: '/add-map',
                      name: 'addMap',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) {
                        final args = state.extra as MapRouteArguments?;
                        return AddMapScreen(
                          initialRoute: args?.route,
                          isViewMode: args?.isViewMode ?? false,
                        );
                      },
                    ),
                  ],
                  builder: (context, state) {
                    return BlocProvider(
                      create: (context) => PostCreateBloc(
                        useCase: getIt<PostCreateUseCase>(),
                        notificationCubit: getIt<NotificationCubit>(),
                      ),
                      child: const AddPostScreen(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              name: "search",
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/im',
              name: "im",
              builder: (context, state) {
                return MyProfileScreen(
                );
              },
              routes: [
                GoRoute(
                  path: '/edit',
                  name: "edit",
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>;
                    final String currentName = extra["currentName"] as String;
                    final String currentProfileDescription =
                        extra["currentProfileDescription"] as String;
                    final String? currentAvatarUrl =
                        extra["currentAvatarUrl"] as String?;
                    return EditProfileScreen(
                      currentName: currentName,
                      currentProfileDescription: currentProfileDescription,
                      currentAvatarUrl: currentAvatarUrl,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MapRouteArguments {
  final MapRouteModel? route;
  final bool isViewMode;

  MapRouteArguments({
    this.route,
    this.isViewMode = false,
  });
}

