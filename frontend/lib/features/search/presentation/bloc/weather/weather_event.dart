part of 'weather_bloc.dart';

sealed class WeatherEvent {}

final class FetchWeatherEvent extends WeatherEvent {
  final double latitude;
  final double longitude;

  FetchWeatherEvent({required this.latitude, required this.longitude});
}
