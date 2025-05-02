part of 'city_bloc.dart';

sealed class CityEvent {}

final class FetchCityEvent extends CityEvent {
  final String cityName;

  FetchCityEvent({required this.cityName});
}
