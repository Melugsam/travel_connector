import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/features/auth/presentation/login_screen.dart';
import 'package:travel_connector/features/auth/presentation/register_screen.dart';
import 'package:travel_connector/features/navigation/presentation/navigation_screen.dart';
import 'package:travel_connector/features/newsfeed/domain/entity/post_entity.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_write_comment/post_write_comment_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/bloc/post_like/post_like_bloc.dart';
import 'package:travel_connector/features/newsfeed/presentation/comments_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/newsfeed_screen.dart';
import 'package:travel_connector/features/profile/presentation/edit_profile_screen.dart';
import 'package:travel_connector/features/profile/presentation/profile_screen.dart';
import 'package:travel_connector/features/search/presentation/search_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter route = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => RegisterScreen(),
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
                    final extra = state.extra as Map<String, dynamic>;
                    final PostEntity post = extra["post"] as PostEntity;
                    final PostWriteCommentBloc postWriteCommentBloc =
                        extra["postWriteCommentBloc"] as PostWriteCommentBloc;
                    return CommentsScreen(
                      post: post,
                      postWriteCommentBloc: postWriteCommentBloc,
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
              path: '/profile',
              name: "profile",
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
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
