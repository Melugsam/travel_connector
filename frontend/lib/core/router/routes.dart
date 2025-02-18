import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/features/app/presentation/server_error_screen.dart';
import 'package:travel_connector/features/app/presentation/splash_screen.dart';
import 'package:travel_connector/features/auth/presentation/login_screen.dart';
import 'package:travel_connector/features/auth/presentation/register_screen.dart';
import 'package:travel_connector/features/navigation/presentation/navigation_screen.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/presentation/comments_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/newsfeed_screen.dart';
import 'package:travel_connector/features/profile/presentation/edit_profile_screen.dart';
import 'package:travel_connector/features/profile/presentation/profile_screen.dart';
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
                return ProfileScreen(userId: null,);
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
