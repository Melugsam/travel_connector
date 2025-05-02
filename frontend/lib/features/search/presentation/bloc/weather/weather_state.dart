part of 'weather_bloc.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;

  WeatherSuccess({required this.weather});
}

final class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}

final class WeatherLoading extends WeatherState {}
