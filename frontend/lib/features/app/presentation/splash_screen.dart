import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';
import 'package:travel_connector/features/app/presentation/bloc/splash/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(
        getIt(),
      )..add(
          CheckSessionEvent(),
        ),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            context.read<SessionBloc>().add(AuthenticatedSessionEvent());
          }
        },
        child: const Scaffold(
          body: Center(
            child: CustomCircularIndicatorWidget(),
          ),
        ),
      ),
    );
  }
}
