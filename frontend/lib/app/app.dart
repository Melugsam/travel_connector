import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_connector/app/routes.dart';
import 'package:travel_connector/core/theme/theme.dart';

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
        builder: (context, child) => child!,
      ),
    );
  }
}
