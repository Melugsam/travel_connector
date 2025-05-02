part of 'splash_bloc.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashSuccess extends SplashState {}

final class SplashError extends SplashState {}
