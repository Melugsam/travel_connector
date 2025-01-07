import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/features/auth/presentation/login_screen.dart';
import 'package:travel_connector/features/auth/presentation/register_screen.dart';
import 'package:travel_connector/features/navigation/presentation/navigation_screen.dart';
import 'package:travel_connector/features/newsfeed/presentation/neewsfeed_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter route = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/newsfeed",
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
            ),
          ],
        ),
      ],
    ),
  ],
);
