import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/router/routes.dart';
import 'package:travel_connector/core/theme/theme.dart';
import 'package:travel_connector/features/app/presentation/bloc/session_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerDelegate: route.routerDelegate,
        routeInformationParser: route.routeInformationParser,
        routeInformationProvider: route.routeInformationProvider,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return BlocProvider.value(
            value: getIt<SessionBloc>(),
            child: BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                if (state is SessionLogout){
                  context.pushReplacementNamed('login');
                }
              },
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
